package omnix.mobile;

class OmnixBridge {
    public var endpoint:String = "http://127.0.0.1:8765";
    public function new(?endpoint:String) {
        if (endpoint != null && endpoint != "") this.endpoint = endpoint;
    }
    public function status():String return "Bridge endpoint: " + endpoint;
}
