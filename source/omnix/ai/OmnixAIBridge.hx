package omnix.ai;

class OmnixAIBridge {
    public static inline var API_VERSION:String = "2";
    public static function validateCommand(command:Dynamic):Bool return command != null;

    public static function createChat(?provider:OmnixAIProvider):OmnixAIChat {
        return new OmnixAIChat(provider);
    }

    public static function createContext():OmnixAIContext {
        return new OmnixAIContext();
    }
}
