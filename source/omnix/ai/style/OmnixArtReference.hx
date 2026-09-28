package omnix.ai.style;

class OmnixArtReference {
    public var id:String;
    public var path:String;
    public var kind:String;
    public var weight:Float;
    public var notes:String;

    public function new(id:String, path:String, kind:String = "style", weight:Float = 1.0, notes:String = "") {
        this.id = id;
        this.path = path;
        this.kind = kind;
        this.weight = weight;
        this.notes = notes;
    }
}
