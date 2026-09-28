package omnix.ai.draw;

class OmnixDrawTool {
    public static function buildPrompt(task:String):String {
        return "OmnixFNF-Draw task. Preserve the identity of user-provided original characters. "
            + "Use a clean 2D sprite workflow with separate editable parts. "
            + "Required output plan: character parts, layers, rig, poses, expressions, animation frames, "
            + "spritesheet layout and engine export. Task: " + task;
    }
}
