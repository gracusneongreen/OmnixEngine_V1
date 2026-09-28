package omnix.ai.cutscene;

class OmnixCutsceneAI {
    public var systemPrompt:String;

    public function new() {
        systemPrompt = "Generate game cutscenes as structured data: dialogue, expressions, voice profiles, camera, animation, sound and game events. Never claim that an asset or audio file exists until a provider returns it.";
    }

    public function createTemplate(id:String, title:String, prompt:String):OmnixCutscene {
        var scene = new OmnixCutscene(id, title);
        scene.gameEvents.push("ai_prompt:" + prompt);
        return scene;
    }
}
