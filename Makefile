# NiGHTS into Dreams... decompilation
# Put your own dump (cue + bins) in dump/ and run `make setup`.

REGION  ?= usa
# Redump file names contain spaces, so the cue is found by the shell rather than make.
CUE     ?= $(shell ls dump/*.cue 2>/dev/null | head -n 1)
EXTRACT := extracted/$(REGION)
PYTHON  ?= python3

TOOLCHAIN ?= toolchain/bin
OBJDIFF := $(TOOLCHAIN)/objdiff-cli
AS      := $(TOOLCHAIN)/sh-elf-as
LD      := $(TOOLCHAIN)/sh-elf-ld
OBJCOPY := $(TOOLCHAIN)/sh-elf-objcopy
ASFLAGS := --isa=sh2 -big -I include

BUILD   := build/$(REGION)
MAIN    := 0NIGHTS
MAIN_CFG := config/$(REGION)/$(MAIN).toml

.PHONY: all setup extract unpack verify ghidra split check report upload test toolchain clean distclean

all: check

setup: extract unpack verify

extract: $(EXTRACT)/manifest.txt

$(EXTRACT)/manifest.txt:
	@test -n "$(CUE)" || (echo "no .cue found in dump/"; exit 1)
	$(PYTHON) tools/extract_disc.py "$(CUE)" $(EXTRACT)

unpack: $(EXTRACT)/manifest.txt
	$(PYTHON) tools/unpack_prs.py $(EXTRACT)/files $(EXTRACT)/prs

verify: $(EXTRACT)/manifest.txt
	$(PYTHON) tools/verify.py config/$(REGION)/files.sha1 $(EXTRACT)

ghidra: $(EXTRACT)/manifest.txt
	tools/ghidra/import.sh

toolchain: $(AS) $(OBJDIFF)

$(AS):
	tools/build_binutils.sh

$(OBJDIFF):
	tools/get_objdiff.sh

# Regenerate assembly from the dump. The output is derived from the game and stays in
# build/; units that have been reviewed live in src/ and are linked in their place.
SRC_FILES := $(shell find src -name '*.s' -o -name '*.c' 2>/dev/null | sort)
# Adding or removing a src/ file changes which object is linked, so force a re-split.
# (Deleting the outputs rather than comparing mtimes: make 3.81 has 1 s resolution.)
SRC_LIST  := $(BUILD)/src_files.txt
$(shell mkdir -p $(BUILD); echo "$(SRC_FILES)" | cmp -s - $(SRC_LIST) || \
	{ echo "$(SRC_FILES)" > $(SRC_LIST); rm -f $(BUILD)/$(MAIN).ld $(BUILD)/units.mk; })

split: $(BUILD)/$(MAIN).ld

SYMBOL_FILES := config/$(REGION)/symbols.txt $(wildcard config/$(REGION)/symbols/*.txt)

$(BUILD)/$(MAIN).ld $(BUILD)/units.mk: $(MAIN_CFG) $(SYMBOL_FILES) config/$(REGION)/units.txt \
		include/saturn.inc tools/split.py tools/sh2analyze.py tools/sh2dis.py $(SRC_LIST)
	$(PYTHON) tools/split.py $(MAIN_CFG)

-include $(BUILD)/units.mk

TARGET_OBJS := $(UNITS:%=$(BUILD)/asm/%.o)
BASE_OBJS   := $(SRC_UNITS:%=$(BUILD)/src/%.o)
# A C unit is only linked once units.txt marks it complete; until then it is just
# the objdiff base for the functions written so far.
LINK_OBJS   := $(foreach u,$(UNITS),$(if $(filter $(u),$(LINKED_UNITS)),$(BUILD)/src/$(u).o,$(BUILD)/asm/$(u).o))

$(BUILD)/asm/%.s: $(BUILD)/$(MAIN).ld ;

$(BUILD)/asm/%.o: $(BUILD)/asm/%.s include/macro.inc | $(AS)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD)/src/%.o: src/%.s include/macro.inc include/saturn.inc | $(AS)
	@mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) -o $@ $<

# C goes through Hitachi SHC (under wine) and tools/shc2gas.py.
C_HEADERS := $(shell find include -name '*.h' 2>/dev/null)

$(BUILD)/src/%.s: src/%.c $(C_HEADERS) tools/shc.py tools/shc2gas.py
	$(PYTHON) tools/shc.py cc $< $@

$(BUILD)/src/%.o: $(BUILD)/src/%.s | $(AS)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD)/$(MAIN).elf: $(BUILD)/$(MAIN).ld $(LINK_OBJS)
	$(LD) -T $(BUILD)/$(MAIN).ld -Map $(BUILD)/$(MAIN).map -o $@

$(BUILD)/$(MAIN): $(BUILD)/$(MAIN).elf
	$(OBJCOPY) -O binary $< $@

# The rebuilt program must be byte-identical to the original.
check: $(BUILD)/$(MAIN)
	@echo "$$(grep '^sha1' $(MAIN_CFG) | cut -d'"' -f2)  $(BUILD)/$(MAIN)" | shasum -a 1 -c -

test: | $(AS)
	$(PYTHON) tests/test_sh2dis.py
	$(PYTHON) tests/test_shc2gas.py
	$(PYTHON) tests/test_c2asm.py

# objdiff progress report, and upload to bytematch.dev. The game can't be built in
# public CI, so reports are uploaded from a machine with a dump. Needs BYTEMATCH_TOKEN
# (create one on the project's manage page).
BYTEMATCH := https://bytematch.dev/api/v1/projects/manta89640/nightsintodreams/reports

report: check $(TARGET_OBJS) $(BASE_OBJS) | $(OBJDIFF)
	$(OBJDIFF) report generate -o $(BUILD)/report.json

upload: report
	@test -n "$$BYTEMATCH_TOKEN" || (echo "set BYTEMATCH_TOKEN first"; exit 1)
	@test -z "$$(git status --porcelain -- config include src tools objdiff.json)" || \
		(echo "commit your changes first: the report is tagged with HEAD"; exit 1)
	gzip -c $(BUILD)/report.json | curl --fail -sS -X POST \
		-H "Authorization: Bearer $$BYTEMATCH_TOKEN" -H "Content-Encoding: gzip" \
		--data-binary @- \
		"$(BYTEMATCH)?version=$(REGION)&commit=$$(git rev-parse HEAD)&commit_message=$$(git log -1 --format=%s | tr -d "\n" | jq -sRr @uri)"

clean:
	rm -rf build

distclean: clean
	rm -rf extracted
