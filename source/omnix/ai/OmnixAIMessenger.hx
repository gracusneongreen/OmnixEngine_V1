package omnix.ai;

class OmnixAIMessenger {
    public var messages:Array<OmnixAIMessage>;
    public var proactiveMode:OmnixAIProactiveMode;

    public function new() {
        messages = [];
        proactiveMode = new OmnixAIProactiveMode();
    }

    public function sendUser(text:String):OmnixAIMessage {
        var message = new OmnixAIMessage(
            createId(),
            USER,
            text,
            SENT
        );
        messages.push(message);
        return message;
    }

    public function sendAssistant(text:String, status:OmnixAIMessageStatus = COMPLETE, actionable:Bool = false):OmnixAIMessage {
        var message = new OmnixAIMessage(
            createId(),
            ASSISTANT,
            text,
            status,
            actionable
        );
        messages.push(message);
        return message;
    }

    public function sendProactive(text:String, status:OmnixAIMessageStatus = COMPLETE, actionable:Bool = false):Null<OmnixAIMessage> {
        if (!proactiveMode.canSendProactiveReply()) return null;
        return sendAssistant(text, status, actionable);
    }

    public function clear():Void {
        messages = [];
    }

    private function createId():String {
        return "msg-" + Std.int(Date.now().getTime()) + "-" + messages.length;
    }
}
