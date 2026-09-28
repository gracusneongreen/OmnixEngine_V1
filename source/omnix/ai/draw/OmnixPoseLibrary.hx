package omnix.ai.draw;

import haxe.ds.StringMap;
import omnix.core.OmnixID;

class OmnixPoseLibrary {
    private var poses:StringMap<OmnixHumanRig>;

    public function new() {
        poses = new StringMap<OmnixHumanRig>();
    }

    public function save(name:String, rig:OmnixHumanRig):String {
        var id = OmnixID.make("POSE", name);
        poses.set(id, rig);
        poses.set(name, rig);
        return id;
    }

    public function get(idOrName:String):OmnixHumanRig {
        return poses.get(idOrName);
    }

    public function remove(idOrName:String):Bool {
        var rig = poses.get(idOrName);
        if (rig == null) return false;
        poses.remove(idOrName);
        return true;
    }
}
