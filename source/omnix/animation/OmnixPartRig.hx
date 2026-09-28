package omnix.animation;

class OmnixPartRig {
    var parts:Map<String, Dynamic> = new Map();
    public function new() {}
    public function attach(name:String, object:Dynamic):Void parts.set(name, object);
    public function get(name:String):Dynamic return parts.exists(name) ? parts.get(name) : null;
    public function remove(name:String):Void parts.remove(name);
}
