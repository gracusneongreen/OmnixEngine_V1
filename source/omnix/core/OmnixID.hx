package omnix.core;

import haxe.ds.StringMap;
import haxe.crypto.Md5;

/**
 * Stable identifiers for OmnixEngine objects, projects and AI actions.
 *
 * Format:
 *   OMNIX-<TYPE>-<HEX>
 *
 * IDs are deterministic when a seed is supplied and can be registered
 * to prevent accidental collisions inside a running engine session.
 */
class OmnixID {
    public static inline var VERSION:String = "1";

    private static var registry:StringMap<Bool> = new StringMap<Bool>();

    public static function make(kind:String, seed:String):String {
        var safeKind = normalizeKind(kind);
        var hash = Md5.encode(VERSION + "|" + safeKind + "|" + seed);
        var id = "OMNIX-" + safeKind + "-" + hash.substr(0, 8).toUpperCase();
        registry.set(id, true);
        return id;
    }

    public static function random(kind:String):String {
        var seed = Std.string(Date.now().getTime()) + ":" + Math.random();
        return make(kind, seed);
    }

    public static function isRegistered(id:String):Bool {
        return id != null && registry.exists(id);
    }

    public static function register(id:String):Bool {
        if (id == null || id.length == 0 || registry.exists(id)) return false;
        registry.set(id, true);
        return true;
    }

    public static function release(id:String):Void {
        if (id != null) registry.remove(id);
    }

    public static function clearRegistry():Void {
        registry = new StringMap<Bool>();
    }

    private static function normalizeKind(kind:String):String {
        var value = kind == null ? "OBJECT" : kind.toUpperCase();
        value = StringTools.replace(value, " ", "_");
        value = StringTools.replace(value, "-", "_");
        return value.length == 0 ? "OBJECT" : value;
    }
}
