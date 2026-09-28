package omnix.ai.draw;

class OmnixCharacterPoseSet {
    public var poses:Map<String,String> = new Map<String,String>();

    public function new() {}

    public function setPose(name:String, path:String):Void poses.set(name, path);
    public function getPose(name:String):Null<String> return poses.get(name);
}
