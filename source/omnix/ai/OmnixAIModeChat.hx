package omnix.ai;

class OmnixAIModeChat {
    public var chat:OmnixAIChat;
    public var mode:String;
    public var context:OmnixAIContext;

    public function new(?mode:String = "chat", ?provider:OmnixAIProvider) {
        this.mode = mode;
        chat = new OmnixAIChat(provider);
        context = new OmnixAIContext();
    }

    public function ask(question:String, onAnswer:String->Void, ?onError:String->Void):Void {
        var routed = OmnixAIPromptRouter.buildQuestion(mode, context, question);
        chat.ask(routed, onAnswer, onError);
    }

    public function setMode(newMode:String):Void {
        mode = newMode;
    }

    public function clear():Void {
        chat.clear();
    }
}