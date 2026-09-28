package omnix.ai.computer;

class OmnixComputerRetryPolicy {
    public var maxRetries:Int = 2;
    public var retryDelayMs:Int = 250;

    public function new(?maxRetries:Int = 2) {
        this.maxRetries = maxRetries;
    }

    public function shouldRetry(attempt:Int):Bool {
        return attempt < maxRetries;
    }
}
