package omnix.ai;

class OmnixAIContext {
    public var engineVersion:String;
    public var song:String;
    public var difficulty:String;
    public var character:String;
    public var stage:String;

    public function new(?engineVersion:String = "OmnixEngine 1.0.0-dev") {
        this.engineVersion = engineVersion;
        song = "";
        difficulty = "";
        character = "";
        stage = "";
    }

    public function toPrompt():String {
        return "Project context: engine=" + engineVersion +
            ", song=" + song +
            ", difficulty=" + difficulty +
            ", character=" + character +
            ", stage=" + stage;
    }
}