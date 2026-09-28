package omnix.ai.computer;

class OmnixScreenObservation {
    public var rawVision:String;
    public var actionHint:String;
    public var confidence:Float;
    public var width:Int;
    public var height:Int;

    public function new(rawVision:String = "") {
        this.rawVision = rawVision;
        this.actionHint = "";
        this.confidence = 0;
        this.width = 0;
        this.height = 0;
    }
}
