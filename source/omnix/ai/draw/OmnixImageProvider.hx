package omnix.ai.draw;

class OmnixImageProvider {
    public var endpoint:String;
    public var generatePath:String;

    public function new(?endpoint:String = "http://127.0.0.1:8188", ?generatePath:String = "/api/generate") {
        this.endpoint = endpoint;
        this.generatePath = generatePath;
    }

    public function generate(
        request:OmnixImageGenerationRequest,
        callback:OmnixImageGenerationResult->Void,
        ?onError:String->Void
    ):Void {
        var http = new haxe.Http(endpoint + generatePath);
        http.setHeader("Content-Type", "application/json");
        http.setPostData(haxe.Json.stringify({
            prompt: request.prompt,
            negative_prompt: request.negativePrompt,
            width: request.width == null ? 512 : request.width,
            height: request.height == null ? 512 : request.height,
            steps: request.steps == null ? 20 : request.steps,
            guidance_scale: request.guidanceScale == null ? 7.0 : request.guidanceScale,
            seed: request.seed == null ? -1 : request.seed,
            output_path: request.outputPath,
            adapters: {
                style: request.styleAdapter,
                character: request.characterAdapter,
                background: request.backgroundAdapter
            }
        }));
        http.onData = function(data:String) {
            try {
                var parsed:Dynamic = haxe.Json.parse(data);
                callback({
                    ok: parsed.ok == true,
                    message: parsed.message == null ? "Image generation completed." : parsed.message,
                    imagePath: parsed.image_path,
                    imageBase64: parsed.image_base64
                });
            } catch (error:Dynamic) {
                if (onError != null) onError("Invalid image backend response: " + Std.string(error));
            }
        };
        http.onError = function(error:String) if (onError != null) onError(error);
        http.request(false);
    }
}
