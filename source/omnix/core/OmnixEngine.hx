package omnix.core;

class OmnixEngine {
    public static inline var VERSION:String = "1.0.0-dev";
    public static var initialized:Bool = false;
    public static function init():Void initialized = true;
    public static function shutdown():Void initialized = false;
}
