package omnix.ai.computer;

class OmnixComputerContext {
    public var connected:Bool = false;
    public var desktopName:String = "Omnix Agent Desktop";
    public var os:String = "unknown";
    public var apps:Array<String> = [];
    public var lastScreenshot:String = "";

    public function toPrompt():String {
        return "COMPUTER ENVIRONMENT:\n" +
            "connected=" + connected + "\n" +
            "desktop=" + desktopName + "\n" +
            "os=" + os + "\n" +
            "apps=" + apps.join(", ") + "\n" +
            "The agent may inspect the desktop, use approved computer actions, open apps, and request app installation.";
    }
}
