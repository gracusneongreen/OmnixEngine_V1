package omnix.ai.debug;

class OmnixDebugger {
    public function new() {}

    public function analyze(logText:String):String {
        if (logText == null || logText == "") return "No log data supplied.";
        if (logText.indexOf("Null Object Reference") >= 0) return "Likely null reference. Inspect the object created before the failing call.";
        if (logText.indexOf("SOUND NOT FOUND") >= 0) return "Check the song audio path and asset naming.";
        if (logText.indexOf("No animation found") >= 0) return "Check XML/atlas animation names.";
        return "No known Omnix diagnostic pattern matched.";
    }
}
