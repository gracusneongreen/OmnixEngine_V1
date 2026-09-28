package omnix.ai.draw;

class OmnixDrawEditorState {
    public var rig:OmnixHumanRig;
    public var project:OmnixDrawProject;
    public var selectedPart:String;
    public var activePose:String;

    public function new(?projectName:String = "Untitled Omnix Character") {
        rig = new OmnixHumanRig();
        project = new OmnixDrawProject(projectName);
        selectedPart = "";
        activePose = "idle";
        buildDefaultLayers();
    }

    public function select(partId:String):Void {
        if (rig.get(partId) != null) selectedPart = partId;
    }

    public function applyPose(pose:String):Void {
        activePose = pose;
        OmnixPoseSolver.applyPose(rig, pose);
        syncRigToLayers();
    }

    public function moveSelected(targetX:Float, targetY:Float):Void {
        var part = rig.get(selectedPart);
        if (part == null) return;
        part.x = targetX;
        part.y = targetY;
        syncPartLayer(selectedPart);
    }

    public function rotateSelected(delta:Float):Void {
        var part = rig.get(selectedPart);
        if (part == null) return;
        part.rotation += delta;
        syncPartLayer(selectedPart);
    }

    public function scaleSelected(multiplierX:Float, multiplierY:Float):Void {
        var part = rig.get(selectedPart);
        if (part == null) return;
        part.scaleX *= multiplierX;
        part.scaleY *= multiplierY;
        syncPartLayer(selectedPart);
    }

    public function setAsset(partId:String, assetPath:String, width:Int, height:Int):Void {
        if (rig.get(partId) == null) return;
        var layer = project.getLayer("layer_" + partId);
        if (layer == null) {
            layer = new OmnixDrawLayer("layer_" + partId, partId, assetPath);
            project.addLayer(layer);
        }
        layer.assetPath = assetPath;
        layer.width = width;
        layer.height = height;
        syncPartLayer(partId);
    }

    public function setLayerVisible(partId:String, visible:Bool):Void {
        var layer = project.getLayer("layer_" + partId);
        if (layer != null) layer.visible = visible;
    }

    public function getSelectedLayer():OmnixDrawLayer {
        if (selectedPart == "") return null;
        return project.getLayer("layer_" + selectedPart);
    }

    public function saveProjectJson():String {
        syncRigToLayers();
        return project.toJson();
    }

    private function buildDefaultLayers():Void {
        var ids = [
            "torso", "head", "neck",
            "upper_arm_l", "forearm_l", "hand_l",
            "upper_arm_r", "forearm_r", "hand_r",
            "thigh_l", "shin_l", "foot_l",
            "thigh_r", "shin_r", "foot_r"
        ];

        for (i in 0...ids.length) {
            var id = ids[i];
            var layer = new OmnixDrawLayer("layer_" + id, id);
            layer.zIndex = i;
            project.addLayer(layer);
        }
        syncRigToLayers();
    }

    private function syncRigToLayers():Void {
        for (id in rig.parts.keys()) syncPartLayer(id);
    }

    private function syncPartLayer(partId:String):Void {
        var part = rig.get(partId);
        if (part == null) return;

        var layer = project.getLayer("layer_" + partId);
        if (layer == null) {
            layer = new OmnixDrawLayer("layer_" + partId, partId);
            project.addLayer(layer);
        }

        layer.transform.x = part.x;
        layer.transform.y = part.y;
        layer.transform.rotation = part.rotation;
        layer.transform.scaleX = part.scaleX;
        layer.transform.scaleY = part.scaleY;
    }
}
