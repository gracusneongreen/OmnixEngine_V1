package omnix.ai;

import omnix.ai.computer.OmnixComputerAgent;

class OmnixAIBridge {
    public static inline var API_VERSION:String = "3";
    public static function validateCommand(command:Dynamic):Bool return command != null;

    public static function createChat(?provider:OmnixAIProvider):OmnixAIChat {
        return new OmnixAIChat(provider);
    }

    public static function createContext():OmnixAIContext {
        return new OmnixAIContext();
    }

    public static function createComputerAgent():OmnixComputerAgent {
        return new OmnixComputerAgent();
    }
}
