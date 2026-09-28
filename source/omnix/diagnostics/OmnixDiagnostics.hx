package omnix.diagnostics;

class OmnixDiagnostics {
    public static function info(message:String):Void trace("[Omnix][INFO] " + message);
    public static function warn(message:String):Void trace("[Omnix][WARN] " + message);
    public static function error(message:String):Void trace("[Omnix][ERROR] " + message);
}
