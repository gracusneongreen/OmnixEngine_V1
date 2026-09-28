package omnix.ai.style;

class OmnixBrushProfile {
    public var id:String;
    public var name:String;
    public var size:Float;
    public var hardness:Float;
    public var opacity:Float;
    public var spacing:Float;
    public var smoothing:Float;
    public var texture:String;
    public var edgeStyle:String;

    public function new(id:String, name:String) {
        this.id = id;
        this.name = name;
        size = 10;
        hardness = 1;
        opacity = 1;
        spacing = 0.1;
        smoothing = 0;
        texture = "clean";
        edgeStyle = "hard";
    }
}
