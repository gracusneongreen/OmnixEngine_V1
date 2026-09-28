package omnix.ai;

/**
 * OpenAI-compatible provider configuration.
 * Works with local servers such as LM Studio or vLLM.
 */
class OmnixAIProvider {
    public var baseUrl:String;
    public var model:String;
    public var apiKey:String;

    public function new(?baseUrl:String = "http://127.0.0.1:1234/v1", ?model:String = "OmnixFNF-AI", ?apiKey:String = "lm-studio") {
        this.baseUrl = baseUrl;
        this.model = model;
        this.apiKey = apiKey;
    }

    public function chat(question:String, callback:String->Void, ?onError:String->Void):Void {
        var http = new haxe.Http(baseUrl + "/chat/completions");
        http.setHeader("Content-Type", "application/json");
        if (apiKey != "") http.setHeader("Authorization", "Bearer " + apiKey);

        var body = haxe.Json.stringify({
            model: model,
            messages: [
                {role: "system", content: OmnixFNFKnowledge.SYSTEM_PROMPT},
                {role: "user", content: question}
            ],
            temperature: 0.35
        });

        http.setPostData(body);
        http.onData = function(data:String) callback(data);
        http.onError = function(error:String) {
            if (onError != null) onError(error);
        };
        http.request(false);
    }
}