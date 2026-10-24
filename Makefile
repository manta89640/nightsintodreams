# NiGHTS into Dreams... decompilation
# Put your own dump (cue + bins) in dump/ and run `make setup`.

REGION  ?= usa
# Redump file names contain spaces, so the cue is found by the shell rather than make.
CUE     ?= $(shell ls dump/*.cue 2>/dev/null | head -n 1)
EXTRACT := extracted/$(REGION)
PYTHON  ?= python3

.PHONY: all setup extract unpack verify ghidra clean distclean

all: verify

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

clean:
	rm -rf build

distclean: clean
	rm -rf extracted
