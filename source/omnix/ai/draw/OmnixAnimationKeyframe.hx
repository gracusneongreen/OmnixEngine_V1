package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixAnimationKeyframe {
    public var omnixId:String;
    public var time:Float;
    public var x:Float;
    public var y:Float;
    public var rotation:Float;
    public var scaleX:Float;
    public var scaleY:Float;

    public function new(time:Float = 0, x:Float = 0, y:Float = 0, rotation:Float = 0, scaleX:Float = 1, scaleY:Float = 1) {
        omnixId = OmnixID.random("KEYFRAME");
        this.time = time;
        this.x = x;
        this.y = y;
        this.rotation = rotation;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
    }
}
