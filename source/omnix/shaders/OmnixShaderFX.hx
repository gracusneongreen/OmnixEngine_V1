package omnix.shaders;

class OmnixShaderFX {
    public var enabled:Bool = false;
    public var lastError:String = "";
    public function new() {}
    public function enable():Void { enabled = true; lastError = ""; }
    public function disable(reason:String = ""):Void { enabled = false; lastError = reason; }
    public function safeEnable():Bool {
        try { enable(); return true; }
        catch (e:Dynamic) { disable(Std.string(e)); return false; }
    }
}
