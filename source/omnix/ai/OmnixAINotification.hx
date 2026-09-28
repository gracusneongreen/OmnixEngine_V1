package omnix.ai;

enum OmnixAINotificationType {
    INFO;
    TASK_COMPLETE;
    ERROR;
    APPROVAL_REQUIRED;
    AGENT_WAITING;
    AI_MESSAGE;
}

class OmnixAINotification {
    public var type:OmnixAINotificationType;
    public var title:String;
    public var message:String;
    public var timestamp:Float;
    public var actionable:Bool;

    public function new(type:OmnixAINotificationType, title:String, message:String, actionable:Bool = false) {
        this.type = type;
        this.title = title;
        this.message = message;
        this.timestamp = Date.now().getTime();
        this.actionable = actionable;
    }
}
