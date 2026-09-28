package omnix.ai;

enum OmnixAIMessageRole {
    USER;
    ASSISTANT;
    SYSTEM;
    AGENT;
}

enum OmnixAIMessageStatus {
    SENT;
    THINKING;
    WORKING;
    GENERATING;
    WAITING_APPROVAL;
    ERROR;
    COMPLETE;
}

class OmnixAIMessage {
    public var id:String;
    public var role:OmnixAIMessageRole;
    public var text:String;
    public var timestamp:Float;
    public var status:OmnixAIMessageStatus;
    public var actionable:Bool;

    public function new(id:String, role:OmnixAIMessageRole, text:String, status:OmnixAIMessageStatus = SENT, actionable:Bool = false) {
        this.id = id;
        this.role = role;
        this.text = text;
        this.timestamp = Date.now().getTime();
        this.status = status;
        this.actionable = actionable;
    }
}
