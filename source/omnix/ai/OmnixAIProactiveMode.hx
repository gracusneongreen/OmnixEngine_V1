package omnix.ai;

class OmnixAIProactiveMode {
    public var enabled:Bool = true;
    public var userCanMessageAnytime:Bool = true;
    public var aiCanReplyProactively:Bool = true;
    public var backgroundAgentEnabled:Bool = true;
    public var notifyOnTaskComplete:Bool = true;
    public var notifyOnError:Bool = true;
    public var notifyOnApprovalRequired:Bool = true;

    public function new() {}

    public function canSendProactiveReply():Bool {
        return enabled && aiCanReplyProactively && backgroundAgentEnabled;
    }
}
