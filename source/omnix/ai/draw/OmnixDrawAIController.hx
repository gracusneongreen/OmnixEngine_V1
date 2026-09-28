package omnix.ai.draw;

import haxe.Json;

class OmnixDrawAIController {
    public var editor:OmnixDrawEditorState;
    public var lastAction:String;

    public function new(editor:OmnixDrawEditorState) {
        this.editor = editor;
        lastAction = "";
    }

    public function executeJson(raw:String):Bool {
        if (OmnixDrawValidation.validateAction(raw) != "OK") return false;
        var call:Dynamic;
        try {
            call = Json.parse(raw);
        } catch (e:Dynamic) {
            return false;
        }

        if (Reflect.hasField(call, "tool") && Std.string(call.tool) != "draw") return false;
        if (!Reflect.hasField(call, "action")) return false;

        var action = Std.string(call.action);
        var args:Dynamic = Reflect.hasField(call, "arguments") ? call.arguments : {};

        switch (action) {
            case "select":
                editor.select(Std.string(args.partId));
            case "move":
                editor.select(Std.string(args.partId));
                editor.moveSelected(Std.parseFloat(Std.string(args.x)), Std.parseFloat(Std.string(args.y)));
            case "rotate":
                editor.select(Std.string(args.partId));
                editor.rotateSelected(Std.parseFloat(Std.string(args.degrees)));
            case "scale":
                editor.select(Std.string(args.partId));
                var amount = Std.parseFloat(Std.string(args.amount));
                if (!OmnixDrawValidation.validateScale(amount)) return false;
                editor.scaleSelected(amount, amount);
            case "pose":
                editor.applyPose(Std.string(args.name));
            case "asset":
                editor.setAsset(
                    Std.string(args.partId),
                    Std.string(args.path),
                    Std.int(args.width),
                    Std.int(args.height)
                );
            case "visible":
                editor.setLayerVisible(Std.string(args.partId), args.value == true);
            case "save":
                lastAction = editor.saveProjectJson();
                return true;
            default:
                return false;
        }

        lastAction = action;
        return true;
    }

    public static function toolSchema():String {
        return Json.stringify({
            tool: "draw",
            actions: [
                {name: "select", arguments: ["partId"]},
                {name: "move", arguments: ["partId", "x", "y"]},
                {name: "rotate", arguments: ["partId", "degrees"]},
                {name: "scale", arguments: ["partId", "amount"]},
                {name: "pose", arguments: ["name"]},
                {name: "asset", arguments: ["partId", "path", "width", "height"]},
                {name: "visible", arguments: ["partId", "value"]},
                {name: "save", arguments: []}
            ]
        });
    }
}
