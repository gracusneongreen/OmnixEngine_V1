package omnix.ai.voice;

class OmnixVoiceStudio {
    public var profiles:Array<OmnixVoiceProfile>;
    public var provider:Null<OmnixVoiceProvider>;

    public function new(?provider:OmnixVoiceProvider) {
        profiles = [];
        this.provider = provider;
    }

    public function addProfile(profile:OmnixVoiceProfile):Bool {
        if (!profile.isUsable()) return false;
        profiles.push(profile);
        return true;
    }

    public function findProfile(id:String):Null<OmnixVoiceProfile> {
        for (profile in profiles) {
            if (profile.id == id) return profile;
        }
        return null;
    }

    public function generate(request:OmnixVoiceRequest):OmnixVoiceResult {
        if (provider == null) return new OmnixVoiceResult(false, "", "audio/wav", 0, "none", "No voice provider configured.");
        if (request.inputMode == UPLOAD_REFERENCE && !request.consentConfirmed) {
            return new OmnixVoiceResult(false, "", "audio/wav", 0, "blocked", "Reference voice requires explicit consent.");
        }
        return provider.generate(request);
    }
}
