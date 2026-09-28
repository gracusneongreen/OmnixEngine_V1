package omnix.shaders;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class OmnixShaderPreviewState extends FlxState {
    public var runtime:OmnixShaderRuntime;
    public var preview:FlxSprite;

    override public function create():Void {
        super.create();
        runtime = new OmnixShaderRuntime(100);
        preview = new FlxSprite(0, 0);
        preview.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(preview);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        if (runtime != null) runtime.update(elapsed);
    }
}
