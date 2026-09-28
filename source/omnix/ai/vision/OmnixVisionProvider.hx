package omnix.ai.vision;

import omnix.ai.OmnixAIProvider;

class OmnixVisionProvider {
    public var provider:OmnixAIProvider;

    public function new(?provider:OmnixAIProvider) {
        this.provider = provider == null ? new OmnixAIProvider() : provider;
    }

    public function analyze(request:OmnixVisionRequest, callback:OmnixVisionResult->Void):Void {
        var prompt = request.prompt != null && request.prompt != ""
            ? request.prompt
            : "Analyze this computer screenshot. Identify visible UI elements, approximate clickable coordinates, focused application, dialogs, errors, and the safest next computer action. Do not invent elements that are not visible.";
        provider.chatWithImage(prompt, request.imageBase64, function(raw:String) {
            callback({
                ok: true,
                message: "Vision response received.",
                description: raw,
                text: raw
            });
        }, function(error:String) {
            callback({ok: false, message: error});
        });
    }
}
