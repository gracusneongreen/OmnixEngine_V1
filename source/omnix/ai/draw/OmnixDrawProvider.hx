package omnix.ai.draw;

class OmnixDrawProvider {
    public var endpoint:String = "http://127.0.0.1:8188";

    public function new(?endpoint:String) {
        if (endpoint != null && endpoint != "") this.endpoint = endpoint;
    }

    public function generate(request:OmnixDrawRequest, callback:OmnixDrawResult->Void):Void {
        callback({
            ok: false,
            message: "Connect this provider to a local image backend."
        });
    }
}
