package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixAnimationTimeline {
    public var omnixId:String;
    public var clips:Array<OmnixAnimationClip>;
    public var currentTime:Float;
    public var playing:Bool;
    public var speed:Float;

    public function new() {
        omnixId = OmnixID.random("TIMELINE");
        clips = [];
        currentTime = 0;
        playing = false;
        speed = 1;
    }

    public function addClip(clip:OmnixAnimationClip):Void {
        clips.push(clip);
    }

    public function getClip(idOrName:String):OmnixAnimationClip {
        for (clip in clips) {
            if (clip.omnixId == idOrName || clip.name == idOrName) return clip;
        }
        return null;
    }

    public function play():Void playing = true;
    public function pause():Void playing = false;
    public function stop():Void {
        playing = false;
        currentTime = 0;
    }

    public function seek(time:Float):Void {
        currentTime = Math.max(0, time);
    }

    public function update(delta:Float):Void {
        if (!playing) return;
        currentTime += delta * speed;
        var clip = clips.length > 0 ? clips[0] : null;
        if (clip != null && clip.duration > 0 && currentTime > clip.duration) {
            currentTime = clip.loop ? 0 : clip.duration;
            if (!clip.loop) playing = false;
        }
    }
}
