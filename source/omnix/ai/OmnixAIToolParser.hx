package omnix.ai;

import haxe.Json;

class OmnixAIToolParser {
    public static function parseComputerCall(raw:String):Null<Dynamic> {
        try {
            var root:Dynamic = Json.parse(raw);
            var content:String = "";
            if (Reflect.hasField(root, "choices")) {
                var choices:Array<Dynamic> = cast root.choices;
                if (choices.length > 0 && Reflect.hasField(choices[0], "message")) {
                    var message:Dynamic = choices[0].message;
                    if (Reflect.hasField(message, "content")) content = Std.string(message.content);
                }
            }
            if (content == "") content = raw;
            var start = content.indexOf("{");
            var end = content.lastIndexOf("}");
            if (start < 0 || end <= start) return null;
            return Json.parse(content.substr(start, end - start + 1));
        } catch (e:Dynamic) {
            return null;
        }
    }
}
