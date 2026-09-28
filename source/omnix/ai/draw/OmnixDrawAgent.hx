package omnix.ai.draw;

import omnix.ai.OmnixAIProvider;

class OmnixDrawAgent {
    public var provider:OmnixAIProvider;
    public var request:OmnixDrawRequest;

    public function new(?provider:OmnixAIProvider) {
        this.provider = provider == null ? new OmnixAIProvider() : provider;
    }

    public function plan(prompt:String, callback:String->Void, ?onError:String->Void):Void {
        request = new OmnixDrawRequest(prompt);
        var system = "You are OmnixFNF-Draw Agent. Plan original FNF-compatible 2D assets. "
            + "Break the task into character parts, poses, expressions, layers, animation frames, "
            + "sprite-sheet requirements and export metadata. Do not claim to have created pixels "
            + "when you only produced a plan. Return structured JSON when requested.";
        provider.chat(system + "\nDRAW TASK:\n" + prompt, callback, onError);
    }
}
