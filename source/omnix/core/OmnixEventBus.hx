package omnix.core;

typedef OmnixEventListener = Dynamic -> Void;

class OmnixEventBus {
    static var listeners:Map<String, Array<OmnixEventListener>> = new Map();
    public static function on(name:String, listener:OmnixEventListener):Void {
        if (!listeners.exists(name)) listeners.set(name, []);
        listeners.get(name).push(listener);
    }
    public static function emit(name:String, data:Dynamic = null):Void {
        if (!listeners.exists(name)) return;
        for (listener in listeners.get(name)) listener(data);
    }
}
