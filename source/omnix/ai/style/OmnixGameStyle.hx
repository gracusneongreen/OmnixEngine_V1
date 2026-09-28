package omnix.ai.style;

class OmnixGameStyle {
    public var id:String;
    public var displayName:String;
    public var tags:Array<String>;
    public var palette:String;
    public var world:String;
    public var characterDirection:String;
    public var musicDirection:String;
    public var dialogueDirection:String;
    public var fxDirection:String;

    public function new(id:String, displayName:String) {
        this.id = id;
        this.displayName = displayName;
        tags = [];
        palette = "";
        world = "";
        characterDirection = "";
        musicDirection = "";
        dialogueDirection = "";
        fxDirection = "";
    }
}
