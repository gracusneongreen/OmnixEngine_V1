package omnix.ai;

typedef OmnixChatMessage = {
    var role:String;
    var content:String;
};

class OmnixAIChat {
    public var provider:OmnixAIProvider;
    public var history:Array<OmnixChatMessage>;

    public function new(?provider:OmnixAIProvider) {
        this.provider = provider == null ? new OmnixAIProvider() : provider;
        history = [];
    }

    public function ask(question:String, onAnswer:String->Void, ?onError:String->Void):Void {
        history.push({role: "user", content: question});
        provider.chat(question, function(raw:String) {
            var answer = extractAnswer(raw);
            history.push({role: "assistant", content: answer});
            onAnswer(answer);
        }, onError);
    }

    static function extractAnswer(raw:String):String {
        try {
            var root:Dynamic = haxe.Json.parse(raw);
            if (root.choices != null && root.choices.length > 0) {
                var message = root.choices[0].message;
                if (message != null && message.content != null) return Std.string(message.content);
            }
        } catch (e:Dynamic) {}
        return raw;
    }

    public function clear():Void history = [];
}