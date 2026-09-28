package omnix.ai;

enum OmnixAIActivityStatus {
    ONLINE;
    THINKING;
    WORKING;
    GENERATING;
    WAITING_APPROVAL;
    ERROR;
    COMPLETE;
}

class OmnixAIActivity {
    public var status:OmnixAIActivityStatus;
    public var progress:Float;
    public var detail:String;

    public function new(status:OmnixAIActivityStatus = ONLINE, progress:Float = 0, detail:String = "") {
        this.status = status;
        this.progress = progress;
        this.detail = detail;
    }
}
