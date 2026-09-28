package omnix.ai.draw;

class OmnixAnimationPlayer {
    public var timeline:OmnixAnimationTimeline;
    public var activeClip:OmnixAnimationClip;

    public function new(timeline:OmnixAnimationTimeline) {
        this.timeline = timeline;
    }

    public function play(idOrName:String):Bool {
        var clip = timeline.getClip(idOrName);
        if (clip == null) return false;
        activeClip = clip;
        timeline.currentTime = 0;
        timeline.play();
        return true;
    }

    public function stop():Void {
        timeline.stop();
        activeClip = null;
    }

    public function update(delta:Float):Void {
        timeline.update(delta);
    }
}
