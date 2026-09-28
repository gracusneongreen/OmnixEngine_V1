package omnix.shaders;

import omnix.core.OmnixID;

class OmnixShaderRuntime {
    public var omnixId:String;
    public var active:Bool = false;
    public var shader:OmnixProceduralShader;
    public var uniforms:OmnixShaderUniforms;
    public var lastValidation:String = "EMPTY";

    public function new(?bpm:Float = 100) {
        omnixId = OmnixID.random("SHADER_RUNTIME");
        uniforms = new OmnixShaderUniforms(bpm);
    }

    public function load(shader:OmnixProceduralShader):Bool {
        if (shader == null) return false;
        lastValidation = OmnixShaderValidator.validate(shader.fragmentSource);
        if (lastValidation != "OK") return false;
        this.shader = shader;
        active = true;
        return true;
    }

    public function unload():Void {
        shader = null;
        active = false;
    }

    public function update(delta:Float):Void {
        if (!active) return;
        uniforms.update(delta);
    }
}
