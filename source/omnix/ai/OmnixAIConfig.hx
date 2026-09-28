package omnix.ai;

class OmnixAIConfig {
    public static inline var DEFAULT_URL:String = "http://127.0.0.1:1234/v1";
    public static inline var DEFAULT_MODEL:String = "OmnixFNF-AI";
    public static inline var DEFAULT_API_KEY:String = "lm-studio";

    public var url:String;
    public var model:String;
    public var apiKey:String;

    public function new(?url:String = DEFAULT_URL, ?model:String = DEFAULT_MODEL, ?apiKey:String = DEFAULT_API_KEY) {
        this.url = url;
        this.model = model;
        this.apiKey = apiKey;
    }

    public function createProvider():OmnixAIProvider {
        return new OmnixAIProvider(url, model, apiKey);
    }
}