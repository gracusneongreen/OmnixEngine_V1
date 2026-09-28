package omnix.ai.vision;

class OmnixVisionProvider {
    public var endpoint:String = "http://127.0.0.1:8188";

    public function new(?endpoint:String) {
        if (endpoint != null && endpoint != "") this.endpoint = endpoint;
    }

    public function analyze(request:OmnixVisionRequest, callback:OmnixVisionResult->Void):Void {
        callback({
            ok: false,
            message: "Connect this provider to a compatible local vision model."
        });
    }
}
