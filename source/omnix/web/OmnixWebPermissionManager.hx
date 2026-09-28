package omnix.web;

class OmnixWebPermissionManager {
    public var permissions:OmnixWebPermission;
    public var requireApprovalForDownloads:Bool = true;
    public var requireApprovalForExternalNavigation:Bool = true;

    public function new(?permissions:OmnixWebPermission) {
        this.permissions = permissions == null ? new OmnixWebPermission() : permissions;
    }

    public function canSearch():Bool return permissions.allowSearch;
    public function canOpen(url:String):Bool return permissions.allowOpen && check(url);
    public function canRead(url:String):Bool return permissions.allowRead && check(url);
    public function canDownload(url:String):Bool return permissions.allowDownload && check(url);
    public function needsApprovalForDownload():Bool return requireApprovalForDownloads;
    public function needsApprovalForExternalNavigation():Bool return requireApprovalForExternalNavigation;

    public function check(url:String):Bool {
        var host = extractHost(url);
        return permissions.isDomainAllowed(host);
    }

    private function extractHost(url:String):String {
        if (url == null) return "";
        var start = url.indexOf("://");
        var value = start >= 0 ? url.substr(start + 3) : url;
        var slash = value.indexOf("/");
        if (slash >= 0) value = value.substr(0, slash);
        var colon = value.indexOf(":");
        if (colon >= 0) value = value.substr(0, colon);
        return value;
    }
}