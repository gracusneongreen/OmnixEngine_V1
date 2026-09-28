package omnix.ai.voice;

interface OmnixVoiceProvider {
    public function generate(request:OmnixVoiceRequest):OmnixVoiceResult;
}
