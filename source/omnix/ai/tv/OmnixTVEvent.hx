package omnix.ai.tv;

class OmnixTVEvent {
    public var id:String;
    public var headline:String;
    public var reporter:String;
    public var text:String;
    public var imagePath:String;
    public var voiceProfile:String;
    public var glitch:Bool;
    public var gameEvent:String;

    public function new(id:String, headline:String, text:String, reporter:String = "Reporter") {
        this.id = id;
        this.headline = headline;
        this.text = text;
        this.reporter = reporter;
        imagePath = "";
        voiceProfile = "";
        glitch = false;
        gameEvent = "";
    }
}
