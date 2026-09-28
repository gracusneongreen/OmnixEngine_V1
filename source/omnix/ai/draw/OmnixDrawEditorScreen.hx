package omnix.ai.draw;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OmnixDrawEditorScreen extends FlxState {
    public var editor:OmnixDrawEditorState;
    public var viewport:OmnixDrawViewport;
    public var title:FlxText;
    public var help:FlxText;
    public var selection:FlxText;

    override public function create():Void {
        super.create();

        editor = new OmnixDrawEditorState("Omnix Character");
        viewport = new OmnixDrawViewport(editor, 180, 100);

        add(viewport);

        title = new FlxText(20, 18, 900, "OMNIX DRAW AI  //  CHARACTER RIG EDITOR");
        title.size = 22;
        add(title);

        help = new FlxText(20, 50, 900,
            "DRAG = MOVE    R = ROTATE    [ / ] = SCALE    1-5 = POSE    S = SAVE JSON");
        help.size = 12;
        add(help);

        selection = new FlxText(20, 76, 900, "Selected: none");
        selection.size = 12;
        add(selection);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (editor.selectedPart != "") {
            selection.text = "Selected: " + editor.selectedPart + "  |  Pose: " + editor.activePose;
        }

        if (FlxG.keys.justPressed.R) viewport.rotateSelected(5);
        if (FlxG.keys.justPressed.LBRACKET) viewport.scaleSelected(0.95);
        if (FlxG.keys.justPressed.RBRACKET) viewport.scaleSelected(1.05);

        if (FlxG.keys.justPressed.ONE) editor.applyPose("idle");
        if (FlxG.keys.justPressed.TWO) editor.applyPose("left");
        if (FlxG.keys.justPressed.THREE) editor.applyPose("down");
        if (FlxG.keys.justPressed.FOUR) editor.applyPose("up");
        if (FlxG.keys.justPressed.FIVE) editor.applyPose("right");

        if (FlxG.keys.justPressed.S) {
            trace(editor.saveProjectJson());
        }
    }
}
