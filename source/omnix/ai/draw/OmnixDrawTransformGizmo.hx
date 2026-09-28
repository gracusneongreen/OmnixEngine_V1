package omnix.ai.draw;

class OmnixDrawTransformGizmo {
    public var rotationStep:Float = 5;
    public var scaleStep:Float = 0.05;
    public var moveStep:Float = 4;

    public function rotate(editor:OmnixDrawEditorState, degrees:Float):Void {
        editor.rotateSelected(degrees);
    }

    public function scale(editor:OmnixDrawEditorState, multiplier:Float):Void {
        editor.scaleSelected(multiplier, multiplier);
    }

    public function nudge(editor:OmnixDrawEditorState, dx:Float, dy:Float):Void {
        var part = editor.rig.get(editor.selectedPart);
        if (part == null) return;
        editor.moveSelected(part.x + dx, part.y + dy);
    }
}
