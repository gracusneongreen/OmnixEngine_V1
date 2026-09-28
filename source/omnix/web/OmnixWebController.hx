package omnix.web;

class OmnixWebController {
    public var agent:OmnixWebAgent;

    public function new(?agent:OmnixWebAgent) {
        this.agent = agent == null ? new OmnixWebAgent() : agent;
    }

    public function authorize(action:String, url:String):String {
        if (!agent.canExecute(action, url)) return "DENIED";
        if ((action == "download" && agent.permissions.needsApprovalForDownload()) ||
            (action == "open" && agent.permissions.needsApprovalForExternalNavigation())) {
            return "APPROVAL_REQUIRED";
        }
        return "ALLOWED";
    }
}