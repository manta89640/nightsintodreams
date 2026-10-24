// Adds the Saturn memory map around a raw SH-2 image and marks the entry point.
// Run as a Ghidra pre-script (before auto-analysis) when importing 0NIGHTS with BinaryLoader.
// @category Saturn
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.SourceType;

public class SaturnSetup extends GhidraScript {
    private void region(String name, long start, long size, boolean volatileIo) throws Exception {
        Memory mem = currentProgram.getMemory();
        Address a = toAddr(start);
        if (mem.getBlock(a) != null) {
            return;
        }
        MemoryBlock b = mem.createUninitializedBlock(name, a, size, false);
        b.setRead(true);
        b.setWrite(true);
        b.setVolatile(volatileIo);
    }

    @Override
    public void run() throws Exception {
        region("BIOS", 0x00000000L, 0x80000L, false);
        region("SMPC", 0x00100000L, 0x80L, true);
        region("BACKUP_RAM", 0x00180000L, 0x10000L, false);
        region("LOW_WRAM", 0x00200000L, 0x100000L, false);
        region("CS2_CDBLOCK", 0x05800000L, 0x100000L, true);
        region("SCSP_RAM", 0x05A00000L, 0x80000L, false);
        region("SCSP_REGS", 0x05B00000L, 0x1000L, true);
        region("VDP1_VRAM", 0x05C00000L, 0x80000L, false);
        region("VDP1_FB", 0x05C80000L, 0x40000L, false);
        region("VDP1_REGS", 0x05D00000L, 0x18L, true);
        region("VDP2_VRAM", 0x05E00000L, 0x80000L, false);
        region("VDP2_CRAM", 0x05F00000L, 0x1000L, false);
        region("VDP2_REGS", 0x05F80000L, 0x120L, true);
        region("SCU_REGS", 0x05FE0000L, 0xD0L, true);

        // Everything in High WRAM that 0NIGHTS does not cover is overlay/heap space.
        MemoryBlock main = currentProgram.getMemory().getBlock(toAddr(0x06004000L));
        main.setName("MAIN");
        main.setExecute(true);
        long end = main.getEnd().getOffset() + 1;
        region("HIGH_WRAM_LO", 0x06000000L, 0x4000L, false);
        region("HIGH_WRAM_HI", end, 0x06100000L - end, false);

        region("ONCHIP_REGS", 0xFFFFFE00L, 0x200L, true);

        Address entry = toAddr(0x06004000L);
        createLabel(entry, "_start", true, SourceType.USER_DEFINED);
        currentProgram.getSymbolTable().addExternalEntryPoint(entry);
        disassemble(entry);
    }
}
