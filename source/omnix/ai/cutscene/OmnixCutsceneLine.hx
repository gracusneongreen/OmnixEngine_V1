package omnix.ai.cutscene;

class OmnixCutsceneLine {
    public var speaker:String;
    public var text:String;
    public var expression:String;
    public var voiceProfile:String;
    public var duration:Float;
    public var event:String;

    public function new(speaker:String, text:String, expression:String = "neutral", voiceProfile:String = "", duration:Float = 0, event:String = "") {
        this.speaker = speaker;
        this.text = text;
        this.expression = expression;
        this.voiceProfile = voiceProfile;
        this.duration = duration;
        this.event = event;
    }
}
