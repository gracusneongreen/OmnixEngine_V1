package omnix.ai;

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
        request([
            {role: "system", content: OmnixFNFKnowledge.SYSTEM_PROMPT},
            {role: "user", content: question}
        ], callback, onError);
    }

    public function chatWithImage(question:String, imageBase64:String, callback:String->Void, ?onError:String->Void):Void {
        var content:Array<Dynamic> = [
            {type: "text", text: question},
            {type: "image_url", image_url: {url: "data:image/png;base64," + imageBase64}}
        ];
        request([
            {role: "system", content: OmnixFNFKnowledge.SYSTEM_PROMPT},
            {role: "user", content: content}
        ], callback, onError);
    }

    function request(messages:Array<Dynamic>, callback:String->Void, ?onError:String->Void):Void {
        var http = new haxe.Http(baseUrl + "/chat/completions");
        http.setHeader("Content-Type", "application/json");
        if (apiKey != "") http.setHeader("Authorization", "Bearer " + apiKey);
        http.setPostData(haxe.Json.stringify({
            model: model,
            messages: messages,
            temperature: 0.2
        }));
        http.onData = function(data:String) callback(data);
        http.onError = function(error:String) if (onError != null) onError(error);
        http.request(false);
    }
}
