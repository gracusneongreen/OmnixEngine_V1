package omnix.plugins;

interface OmnixPlugin {
    public function id():String;
    public function version():String;
    public function init():Void;
    public function shutdown():Void;
}
