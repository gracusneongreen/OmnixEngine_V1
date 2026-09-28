package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixCharacterCreator {
    public var omnixId:String;
    public var rig:OmnixHumanRig;
    public var expressions:Array<String>;

    public function new() {
        omnixId = OmnixID.random("CHARACTER");
        rig = new OmnixHumanRig();
        expressions = ["neutral", "happy", "sad", "angry", "scared"];
    }

    public function setAsset(partId:String, path:String, width:Int, height:Int, editor:OmnixDrawEditorState):Bool {
        if (editor == null) return false;
        editor.setAsset(partId, path, width, height);
        return true;
    }
}
