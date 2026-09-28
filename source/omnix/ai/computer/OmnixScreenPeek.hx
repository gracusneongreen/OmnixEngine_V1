package omnix.ai.computer;

/**
 * Screen Peek state shared by the Computer Use UI.
 * The host supplies PNG/JPEG bytes; the engine stores the latest
 * screenshot metadata and exposes it to the desktop viewer.
 */
class OmnixScreenPeek {
    public var connected:Bool;
    public var live:Bool;
    public var imageBase64:String;
    public var mimeType:String;
    public var width:Int;
    public var height:Int;
    public var actionLabel:String;
    public var status:String;
    public var updatedAt:Float;

    public function new() {
        connected = false;
        live = false;
        imageBase64 = "";
        mimeType = "image/png";
        width = 0;
        height = 0;
        actionLabel = "";
        status = "WAITING";
        updatedAt = 0;
    }

    public function setImage(base64:String, ?mime:String = "image/png", ?w:Int = 0, ?h:Int = 0):Void {
        imageBase64 = base64;
        mimeType = mime;
        width = w;
        height = h;
        updatedAt = haxe.Timer.stamp();
        status = "SCREEN_READY";
    }

    public function setAction(label:String):Void {
        actionLabel = label;
        status = "EXECUTING";
    }

    public function clear():Void {
        imageBase64 = "";
        width = 0;
        height = 0;
        actionLabel = "";
        status = "WAITING";
    }
}
