package omnix.memory;

class OmnixProjectMemory {
    var values:Map<String,String> = new Map<String,String>();
    public function new() {}
    public function set(key:String, value:String):Void values.set(key, value);
    public function get(key:String):Null<String> return values.get(key);
    public function clear():Void values = new Map<String,String>();
}
