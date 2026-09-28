package omnix.ai.voice;

enum OmnixVoiceInputMode {
    TEXT;
    UPLOAD_REFERENCE;
}

class OmnixVoiceRequest {
    public var characterId:String;
    public var text:String;
    public var emotion:String;
    public var language:String;
    public var inputMode:OmnixVoiceInputMode;
    public var referencePath:String;
    public var consentConfirmed:Bool;

    public function new(characterId:String, text:String, emotion:String = "neutral", language:String = "en", inputMode:OmnixVoiceInputMode = TEXT, referencePath:String = "", consentConfirmed:Bool = false) {
        this.characterId = characterId;
        this.text = text;
        this.emotion = emotion;
        this.language = language;
        this.inputMode = inputMode;
        this.referencePath = referencePath;
        this.consentConfirmed = consentConfirmed;
    }
}
