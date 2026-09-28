package omnix.ai.draw;

class OmnixDrawEditorState {
    public var rig:OmnixHumanRig;
    public var selectedPart:String;
    public var activePose:String;

    public function new() {
        rig = new OmnixHumanRig();
        selectedPart = "";
        activePose = "idle";
    }

    public function select(partId:String):Void {
        if (rig.get(partId) != null) selectedPart = partId;
    }

    public function applyPose(pose:String):Void {
        activePose = pose;
        OmnixPoseSolver.applyPose(rig, pose);
    }

    public function moveSelected(targetX:Float, targetY:Float):Void {
        var part = rig.get(selectedPart);
        if (part == null) return;
        part.x = targetX;
        part.y = targetY;
    }
}
