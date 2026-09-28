package omnix.ai;

import omnix.ai.voice.OmnixVoiceStudio;
import omnix.ai.cutscene.OmnixCutsceneAI;
import omnix.ai.style.OmnixGameStyleGenerator;

class OmnixGameGenerator {
    public var voice:OmnixVoiceStudio;
    public var cutscenes:OmnixCutsceneAI;
    public var styles:OmnixGameStyleGenerator;

    public function new() {
        voice = new OmnixVoiceStudio();
        cutscenes = new OmnixCutsceneAI();
        styles = new OmnixGameStyleGenerator();
    }

    public function describePipeline():Array<String> {
        return [
            "style",
            "characters",
            "backgrounds",
            "music",
            "charts",
            "voice",
            "cutscenes",
            "tv_events",
            "fx",
            "test",
            "export"
        ];
    }
}
