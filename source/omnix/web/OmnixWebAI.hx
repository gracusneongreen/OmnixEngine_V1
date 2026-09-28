package omnix.web;

import omnix.ai.OmnixAIProvider;
import omnix.core.OmnixID;

class OmnixWebAI {
    public var omnixId:String;
    public var provider:OmnixAIProvider;
    public var permissions:OmnixWebPermissionManager;
    public var systemPrompt:String;

    public function new(?provider:OmnixAIProvider) {
        omnixId = OmnixID.random("WEB_AI");
        this.provider = provider;
        permissions = new OmnixWebPermissionManager();
        systemPrompt = "You are Omnix Web AI. Use web information to support coding, FNF modding, shaders and engine development. Never invent web results. Respect the supplied domain permissions. Summarize sources and separate verified facts from assumptions.";
    }

    public function buildSearchPrompt(query:String):String {
        return systemPrompt + "\nSearch query: " + query + "\nReturn concise source-aware research.";
    }

    public function canUseWeb():Bool return permissions.canSearch();
}