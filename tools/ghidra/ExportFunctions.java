// Writes every function Ghidra found as CSV (address,size,name) to the path given as
// the first script argument. Used to track how much of the program has been mapped.
// @category Saturn
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import java.io.PrintWriter;

public class ExportFunctions extends GhidraScript {
    @Override
    public void run() throws Exception {
        String out = getScriptArgs().length > 0 ? getScriptArgs()[0] : "functions.csv";
        int count = 0;
        long bytes = 0;
        try (PrintWriter w = new PrintWriter(out)) {
            w.println("address,size,name");
            for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                long size = f.getBody().getNumAddresses();
                w.printf("0x%08X,%d,%s%n", f.getEntryPoint().getOffset(), size, f.getName());
                count++;
                bytes += size;
            }
        }
        println(String.format("exported %d functions covering %d bytes to %s", count, bytes, out));
    }
}
