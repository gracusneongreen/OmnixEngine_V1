package omnix.ai.draw;

class OmnixPoseSolver {
    public static function applyPose(rig:OmnixHumanRig, pose:String):Void {
        switch (pose.toLowerCase()) {
            case "idle":
                rig.get("torso").rotation = 0;
                rig.get("upper_arm_l").rotation = 8;
                rig.get("upper_arm_r").rotation = -8;
                rig.get("thigh_l").rotation = 2;
                rig.get("thigh_r").rotation = -2;
            case "left":
                rig.get("torso").rotation = -2;
                rig.get("upper_arm_l").rotation = -25;
                rig.get("upper_arm_r").rotation = 12;
            case "right":
                rig.get("torso").rotation = 2;
                rig.get("upper_arm_l").rotation = -12;
                rig.get("upper_arm_r").rotation = 25;
            case "up":
                rig.get("torso").rotation = -3;
                rig.get("head").y = -8;
            case "down":
                rig.get("torso").rotation = 4;
                rig.get("head").y = 8;
            default:
        }
    }
}
