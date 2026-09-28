package omnix.modding;

import omnix.core.OmnixID;

class OmnixModProject {
    public var omnixId:String;
    public var name:String;
    public var characters:Array<String>;
    public var songs:Array<String>;
    public var charts:Array<String>;
    public var stages:Array<String>;
    public var shaders:Array<String>;
    public var events:Array<String>;

    public function new(?name:String = "Untitled Mod") {
        omnixId = OmnixID.make("MOD", name);
        this.name = name;
        characters = [];
        songs = [];
        charts = [];
        stages = [];
        shaders = [];
        events = [];
    }
}
