package omnix.web;

class OmnixWebPermission {
    public var allowSearch:Bool;
    public var allowOpen:Bool;
    public var allowRead:Bool;
    public var allowDownload:Bool;
    public var allowExternalNavigation:Bool;
    public var allowedDomains:Array<String>;

    public function new() {
        allowSearch = true;
        allowOpen = true;
        allowRead = true;
        allowDownload = false;
        allowExternalNavigation = false;
        allowedDomains = ["github.com", "docs.openfl.org", "api.github.com"];
    }

    public function isDomainAllowed(host:String):Bool {
        if (host == null || host == "") return false;
        var normalized = host.toLowerCase();
        for (domain in allowedDomains) {
            var d = domain.toLowerCase();
            if (normalized == d || StringTools.endsWith(normalized, "." + d)) return true;
        }
        return false;
    }
}