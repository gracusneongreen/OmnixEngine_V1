package omnix.web;

import omnix.core.OmnixID;

class OmnixWebAgent {
    public var omnixId:String;
    public var permissions:OmnixWebPermissionManager;
    public var maxSteps:Int = 12;
    public var stepCount:Int = 0;
    public var lastAction:String = "";

    public function new(?permissions:OmnixWebPermissionManager) {
        omnixId = OmnixID.random("WEB_AGENT");
        this.permissions = permissions == null ? new OmnixWebPermissionManager() : permissions;
    }

    public function canExecute(action:String, url:String):Bool {
        if (action == "search") return permissions.canSearch();
        if (action == "open") return permissions.canOpen(url);
        if (action == "read") return permissions.canRead(url);
        if (action == "download") return permissions.canDownload(url);
        return false;
    }

    public function recordAction(action:String):Bool {
        if (stepCount >= maxSteps) return false;
        stepCount++;
        lastAction = action;
        return true;
    }

    public function reset():Void {
        stepCount = 0;
        lastAction = "";
    }
}