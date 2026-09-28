package omnix.ai.draw;

import omnix.ai.OmnixAIProvider;

class OmnixDrawAgent {
    public var provider:OmnixAIProvider;
    public var request:OmnixDrawRequest;
    public var artContext:OmnixArtAssetContext;

    public function new(?provider:OmnixAIProvider, ?artContext:OmnixArtAssetContext) {
        this.provider = provider == null ? new OmnixAIProvider() : provider;
        this.artContext = artContext == null ? new OmnixArtAssetContext() : artContext;
    }

    public function plan(prompt:String, callback:String->Void, ?onError:String->Void):Void {
        request = {
            prompt: prompt
        };

        var system = "You are OmnixFNF-Draw Agent. Plan original FNF-compatible 2D assets. "
            + "Use the supplied Omnix Art Bible context to keep characters, backgrounds, brushes, "
            + "palette, line weight, lighting and proportions consistent. "
            + "Break the task into character parts, poses, expressions, layers, animation frames, "
            + "sprite-sheet requirements and export metadata. Do not claim to have created pixels "
            + "when you only produced a plan. Return structured JSON when requested.";

        var context = artContext.promptContext("draw");
        provider.chat(
            system + "\n" + context + "\nDRAW TASK:\n" + prompt,
            callback,
            onError
        );
    }
}
