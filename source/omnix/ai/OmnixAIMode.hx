package omnix.ai;

enum abstract OmnixAIMode(String) from String to String {
    var CHAT = "chat";
    var CODE = "code";
    var MOD = "mod";
    var DEBUG = "debug";
    var DRAW = "draw";
    var CHART = "chart";
}