package omnix.shaders;

class OmnixShaderUniforms {
    public var time:Float = 0;
    public var bpm:Float = 100;
    public var beat:Float = 0;
    public var step:Float = 0;
    public var intensity:Float = 1;
    public var resolutionX:Float = 1280;
    public var resolutionY:Float = 720;

    public function new(?bpm:Float = 100) this.bpm = bpm;

    public function update(delta:Float):Void {
        time += delta;
        beat = time * bpm / 60;
        step = beat * 4;
    }

    public function setResolution(width:Float, height:Float):Void {
        resolutionX = width;
        resolutionY = height;
    }
}
