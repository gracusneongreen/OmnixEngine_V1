package omnix.shaders;

import omnix.ai.OmnixAIProvider;

class OmnixShaderAIController {
    public var chat:OmnixShaderChatAI;
    public var runtime:OmnixShaderRuntime;
    public var lastResponse:String = "";

    public function new(?provider:OmnixAIProvider) {
        chat = new OmnixShaderChatAI(provider);
        runtime = new OmnixShaderRuntime();
    }

    public function generate(request:String, callback:String->Void, ?onError:String->Void):Void {
        chat.ask(request, function(response:String) {
            lastResponse = response;
            var result = OmnixShaderValidator.validate(response);
            if (result != "OK") {
                if (onError != null) onError("Generated shader rejected: " + result);
                return;
            }
            callback(response);
        }, onError);
    }

    public function loadGenerated(name:String, source:String):Bool {
        var shader = new OmnixProceduralShader(name, source);
        return runtime.load(shader);
    }

    public function setBPM(value:Float):Void runtime.uniforms.bpm = value;
    public function setIntensity(value:Float):Void runtime.uniforms.intensity = value;
}
