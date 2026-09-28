package omnix.ai.draw;

import haxe.Json;

class OmnixAnimationController {
    public var timeline:OmnixAnimationTimeline;
    public var player:OmnixAnimationPlayer;
    public var lastAction:String;

    public function new(?timeline:OmnixAnimationTimeline) {
        this.timeline = timeline == null ? new OmnixAnimationTimeline() : timeline;
        player = new OmnixAnimationPlayer(this.timeline);
        lastAction = "";
    }

    public function executeJson(raw:String):Bool {
        var call:Dynamic;
        try { call = Json.parse(raw); } catch (e:Dynamic) { return false; }

        if (Reflect.hasField(call, "tool") && Std.string(call.tool) != "draw_animation") return false;
        if (!Reflect.hasField(call, "action")) return false;

        var action = Std.string(call.action);
        var args:Dynamic = Reflect.hasField(call, "arguments") ? call.arguments : {};

        switch (action) {
            case "create_clip":
                var name = Std.string(args.name);
                var clip = new OmnixAnimationClip(name, readFloat(args.duration, 1), args.loop != false);
                timeline.addClip(clip);
                lastAction = clip.omnixId;
            case "add_keyframe":
                var target = Reflect.hasField(call, "target") ? Std.string(call.target) : Std.string(args.clipId);
                var clip = timeline.getClip(target);
                if (clip == null) return false;
                var keyframe = new OmnixAnimationKeyframe(
                    readFloat(args.time, 0), readFloat(args.x, 0), readFloat(args.y, 0),
                    readFloat(args.rotation, 0), readFloat(args.scaleX, 1), readFloat(args.scaleY, 1)
                );
                clip.addKeyframe(keyframe);
                lastAction = keyframe.omnixId;
            case "play":
                var target = Reflect.hasField(call, "target") ? Std.string(call.target) : Std.string(args.clipId);
                if (!player.play(target)) return false;
                lastAction = "PLAY:" + target;
            case "pause":
                timeline.pause(); lastAction = "PAUSE";
            case "stop":
                player.stop(); lastAction = "STOP";
            case "seek":
                timeline.seek(readFloat(args.time, 0)); lastAction = "SEEK";
            case "speed":
                timeline.speed = readFloat(args.value, 1); lastAction = "SPEED";
            default:
                return false;
        }
        return true;
    }

    private static function readFloat(value:Dynamic, fallback:Float):Float {
        if (value == null) return fallback;
        var parsed = Std.parseFloat(Std.string(value));
        return Math.isNaN(parsed) ? fallback : parsed;
    }

    public static function toolSchema():String {
        return Json.stringify({
            tool: "draw_animation",
            actions: [
                {name: "create_clip", arguments: ["name", "duration", "loop"]},
                {name: "add_keyframe", arguments: ["clipId", "time", "x", "y", "rotation", "scaleX", "scaleY"]},
                {name: "play", arguments: ["clipId"]},
                {name: "pause", arguments: []},
                {name: "stop", arguments: []},
                {name: "seek", arguments: ["time"]},
                {name: "speed", arguments: ["value"]}
            ]
        });
    }
}
