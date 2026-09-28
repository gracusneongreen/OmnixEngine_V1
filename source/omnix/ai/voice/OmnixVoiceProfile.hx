package omnix.ai.voice;

class OmnixVoiceProfile {
    public var id:String;
    public var characterId:String;
    public var displayName:String;
    public var provider:String;
    public var referenceAudioPath:String;
    public var language:String;
    public var consentConfirmed:Bool;

    public function new(id:String, characterId:String, displayName:String, provider:String = "local", referenceAudioPath:String = "", language:String = "en", consentConfirmed:Bool = false) {
        this.id = id;
        this.characterId = characterId;
        this.displayName = displayName;
        this.provider = provider;
        this.referenceAudioPath = referenceAudioPath;
        this.language = language;
        this.consentConfirmed = consentConfirmed;
    }

    public function isUsable():Bool {
        return consentConfirmed || referenceAudioPath == "";
    }
}
