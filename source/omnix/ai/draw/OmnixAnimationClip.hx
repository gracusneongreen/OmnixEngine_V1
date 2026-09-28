package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixAnimationClip {
    public var omnixId:String;
    public var name:String;
    public var duration:Float;
    public var loop:Bool;
    public var keyframes:Array<OmnixAnimationKeyframe>;

    public function new(name:String, ?duration:Float = 1, ?loop:Bool = true) {
        omnixId = OmnixID.make("ANIM", name);
        this.name = name;
        this.duration = duration;
        this.loop = loop;
        keyframes = [];
    }

    public function addKeyframe(keyframe:OmnixAnimationKeyframe):Void {
        keyframes.push(keyframe);
        keyframes.sort(function(a, b) return Reflect.compare(a.time, b.time));
        if (keyframe.time > duration) duration = keyframe.time;
    }

    public function getKeyframe(id:String):OmnixAnimationKeyframe {
        for (keyframe in keyframes) if (keyframe.omnixId == id) return keyframe;
        return null;
    }
}
