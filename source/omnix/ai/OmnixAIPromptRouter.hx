package omnix.ai;

/**
 * Converts an AI Center tab into a focused FNF-specialist system prompt.
 */
class OmnixAIPromptRouter {
    public static function systemPrompt(mode:String):String {
        var base = OmnixFNFKnowledge.SYSTEM_PROMPT;

        switch (mode) {
            case "code":
                return base + " Focus on correct, paste-ready Haxe/Lua/code and explain file placement.";
            case "mod":
                return base + " Focus on complete mod architecture: songs, charts, characters, stages, events, assets and folders.";
            case "debug":
                return base + " Focus on diagnosing errors from logs/files. State evidence, likely cause and concrete fixes without inventing missing data.";
            case "draw":
                return base + " Focus on FNF-style asset planning, spritesheets, poses, parts, animation rigs and export specifications.";
            case "chart":
                return base + " Focus on BPM, crochet, step timing, note patterns, sections, difficulty and chart JSON generation.";
            default:
                return base;
        }
    }

    public static function buildQuestion(mode:String, context:OmnixAIContext, question:String):String {
        return systemPrompt(mode) +
            "\n\n" + context.toPrompt() +
            "\nAI Center mode: " + mode +
            "\nUser request: " + question;
    }
}