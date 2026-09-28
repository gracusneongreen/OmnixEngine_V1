package omnix.ai.draw;

class OmnixDrawTransform {
    public var x:Float;
    public var y:Float;
    public var rotation:Float;
    public var scaleX:Float;
    public var scaleY:Float;

    public function new(?x:Float = 0, ?y:Float = 0, ?rotation:Float = 0, ?scaleX:Float = 1, ?scaleY:Float = 1) {
        this.x = x;
        this.y = y;
        this.rotation = rotation;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
    }

    public function copy():OmnixDrawTransform {
        return new OmnixDrawTransform(x, y, rotation, scaleX, scaleY);
    }
}
