package omnix.ui;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * Simple keyboard chat input.
 * Enter sends the current question; Backspace edits it.
 */
class OmnixAIChatInput extends FlxText {
    public var value:String = "";
    public var onSubmit:String->Void;

    public function new(x:Float, y:Float, width:Float, ?submit:String->Void) {
        super(x, y, width, 24, "> ");
        size = 16;
        color = FlxColor.WHITE;
        onSubmit = submit;
    }

    public function updateInput():Void {
        var keys = FlxG.keys.justPressed;

        if (keys.ENTER) {
            var text = StringTools.trim(value);
            if (text != "" && onSubmit != null) onSubmit(text);
            value = "";
            text = "> ";
        }

        if (keys.BACKSPACE && value.length > 0) {
            value = value.substr(0, value.length - 1);
        }

        var chars = FlxG.keys.firstJustPressed();
        if (chars != null) {
            var keyName = Std.string(chars);
            if (keyName.length == 1 && keyName != "\n" && keyName != "\r") {
                value += keyName;
            }
        }

        this.text = "> " + value;
    }
}