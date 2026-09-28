package omnix.shaders;

class OmnixShaderPresetLibrary {
    public static var presets:Array<String> = ["rgb_pulse","glitch","wave","scanlines","corruption","chromatic"];
    public static function exists(name:String):Bool return presets.indexOf(name) >= 0;
}
