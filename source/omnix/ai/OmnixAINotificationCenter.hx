package omnix.ai;

class OmnixAINotificationCenter {
    public var notifications:Array<OmnixAINotification>;

    public function new() {
        notifications = [];
    }

    public function push(notification:OmnixAINotification):Void {
        notifications.push(notification);
    }

    public function taskComplete(message:String):Void {
        push(new OmnixAINotification(TASK_COMPLETE, "OMNIX AI", message));
    }

    public function error(message:String):Void {
        push(new OmnixAINotification(ERROR, "OMNIX AI", message, true));
    }

    public function approval(message:String):Void {
        push(new OmnixAINotification(APPROVAL_REQUIRED, "OMNIX AI", message, true));
    }

    public function agentWaiting(message:String):Void {
        push(new OmnixAINotification(AGENT_WAITING, "OMNIX AI", message));
    }

    public function proactive(message:String):Void {
        push(new OmnixAINotification(AI_MESSAGE, "OMNIX AI", message));
    }
}
