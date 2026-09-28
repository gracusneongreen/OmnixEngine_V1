package omnix.ai.draw;

class OmnixHumanPart {
    public var id:String;
    public var parentId:String;
    public var x:Float;
    public var y:Float;
    public var rotation:Float;
    public var scaleX:Float;
    public var scaleY:Float;

    public function new(id:String, ?parentId:String = "") {
        this.id = id;
        this.parentId = parentId;
        x = 0;
        y = 0;
        rotation = 0;
        scaleX = 1;
        scaleY = 1;
    }
}
