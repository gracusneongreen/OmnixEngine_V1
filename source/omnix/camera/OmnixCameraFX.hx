package omnix.camera;

class OmnixCameraFX {
    public var beatZoom:Float = 0.015;
    public var shakeStrength:Float = 0;
    public var rotation:Float = 0;
    public function new() {}
    public function pulse():Float return beatZoom;
    public function setShake(strength:Float):Void shakeStrength = Math.max(0, strength);
    public function setRotation(value:Float):Void rotation = value;
    public function reset():Void { shakeStrength = 0; rotation = 0; }
}
