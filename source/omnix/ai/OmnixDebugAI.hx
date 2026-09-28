package omnix.ai;

import omnix.core.OmnixID;

class OmnixDebugAI {
    public var omnixId:String;

    public function new() omnixId = OmnixID.random("DEBUG_AI");

    public function classify(error:String):String {
        if (error == null) return "unknown";
        var value = error.toLowerCase();
        if (value.indexOf("null object") >= 0) return "null_reference";
        if (value.indexOf("animation") >= 0) return "missing_animation";
        if (value.indexOf("chart") >= 0) return "chart_error";
        if (value.indexOf("shader") >= 0) return "shader_error";
        if (value.indexOf("xml") >= 0) return "xml_error";
        if (value.indexOf("asset") >= 0) return "asset_error";
        return "unknown";
    }
}
