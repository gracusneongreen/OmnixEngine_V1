package omnix.ai.voice;

class OmnixVoiceResult {
    public var ok:Bool;
    public var audioPath:String;
    public var mimeType:String;
    public var duration:Float;
    public var provider:String;
    public var message:String;

    public function new(ok:Bool = false, audioPath:String = "", mimeType:String = "audio/wav", duration:Float = 0, provider:String = "", message:String = "") {
        this.ok = ok;
        this.audioPath = audioPath;
        this.mimeType = mimeType;
        this.duration = duration;
        this.provider = provider;
        this.message = message;
    }
}
