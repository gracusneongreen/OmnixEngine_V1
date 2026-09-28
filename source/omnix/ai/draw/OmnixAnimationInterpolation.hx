package omnix.ai.draw;

class OmnixAnimationInterpolation {
    public static function sample(clip:OmnixAnimationClip, time:Float):OmnixAnimationKeyframe {
        if (clip == null || clip.keyframes.length == 0) return null;
        var frames = clip.keyframes;
        if (time <= frames[0].time) return copyFrame(frames[0]);
        if (time >= frames[frames.length - 1].time) return copyFrame(frames[frames.length - 1]);

        var a = frames[0];
        var b = frames[frames.length - 1];
        for (i in 0...frames.length - 1) {
            if (time >= frames[i].time && time <= frames[i + 1].time) {
                a = frames[i]; b = frames[i + 1]; break;
            }
        }

        var span = b.time - a.time;
        var t = span <= 0 ? 0 : (time - a.time) / span;
        return new OmnixAnimationKeyframe(time,
            lerp(a.x, b.x, t), lerp(a.y, b.y, t), lerp(a.rotation, b.rotation, t),
            lerp(a.scaleX, b.scaleX, t), lerp(a.scaleY, b.scaleY, t));
    }

    private static function lerp(a:Float, b:Float, t:Float):Float {
        return a + (b - a) * t;
    }

    private static function copyFrame(source:OmnixAnimationKeyframe):OmnixAnimationKeyframe {
        return new OmnixAnimationKeyframe(source.time, source.x, source.y, source.rotation, source.scaleX, source.scaleY);
    }
}
