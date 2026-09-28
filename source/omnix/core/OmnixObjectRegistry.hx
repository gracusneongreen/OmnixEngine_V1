package omnix.core;

import haxe.ds.StringMap;

/**
 * Registry for uniquely identified Omnix runtime objects.
 */
class OmnixObjectRegistry {
    private var objects:StringMap<Dynamic>;

    public function new() {
        objects = new StringMap<Dynamic>();
    }

    public function add(kind:String, seed:String, object:Dynamic):String {
        var id = OmnixID.make(kind, seed);
        objects.set(id, object);
        return id;
    }

    public function addWithId(id:String, object:Dynamic):Bool {
        if (id == null || id.length == 0 || objects.exists(id)) return false;
        objects.set(id, object);
        OmnixID.register(id);
        return true;
    }

    public function get(id:String):Dynamic {
        return id == null ? null : objects.get(id);
    }

    public function contains(id:String):Bool {
        return id != null && objects.exists(id);
    }

    public function remove(id:String):Bool {
        if (!contains(id)) return false;
        objects.remove(id);
        OmnixID.release(id);
        return true;
    }

    public function count():Int {
        var total = 0;
        for (_ in objects.keys()) total++;
        return total;
    }

    public function clear():Void {
        for (id in objects.keys()) OmnixID.release(id);
        objects = new StringMap<Dynamic>();
    }
}
