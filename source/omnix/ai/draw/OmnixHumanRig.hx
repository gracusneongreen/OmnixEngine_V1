package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixHumanRig {
    public var omnixId:String;
    public var parts:Map<String, OmnixHumanPart>;
    public var root:String = "torso";

    public function new() {
        omnixId = OmnixID.random("RIG");
        parts = new Map<String, OmnixHumanPart>();
        add("head", "torso");
        add("neck", "torso");
        add("torso");
        add("upper_arm_l", "torso");
        add("forearm_l", "upper_arm_l");
        add("hand_l", "forearm_l");
        add("upper_arm_r", "torso");
        add("forearm_r", "upper_arm_r");
        add("hand_r", "forearm_r");
        add("thigh_l", "torso");
        add("shin_l", "thigh_l");
        add("foot_l", "shin_l");
        add("thigh_r", "torso");
        add("shin_r", "thigh_r");
        add("foot_r", "shin_r");
    }

    public function add(id:String, ?parentId:String = ""):OmnixHumanPart {
        var part = new OmnixHumanPart(id, parentId);
        parts.set(id, part);
        return part;
    }

    public function get(id:String):OmnixHumanPart {
        return parts.get(id);
    }

    public function getByOmnixId(id:String):OmnixHumanPart {
        for (part in parts) if (part.omnixId == id) return part;
        return null;
    }
}
