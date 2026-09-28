package omnix.core;

import haxe.Json;

class OmnixProjectFile {
    public static function save(name:String, context:Dynamic):String {
        return Json.stringify({version: 1, format: "omnixproject", id: OmnixID.make("PROJECT_FILE", name), name: name, context: context});
    }

    public static function load(raw:String):Dynamic {
        return Json.parse(raw);
    }
}
