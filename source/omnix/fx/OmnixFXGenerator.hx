package omnix.fx;

import omnix.core.OmnixID;

class OmnixFXGenerator {
    public var omnixId:String;
    public var effects:Array<String>;

    public function new() {
        omnixId = OmnixID.random("FX");
        effects = ["rgb", "glitch", "chromatic", "scanlines", "wave", "shake", "flash", "vignette", "distortion", "corruption"];
    }

    public function hasEffect(name:String):Bool return effects.indexOf(name.toLowerCase()) >= 0;
}
