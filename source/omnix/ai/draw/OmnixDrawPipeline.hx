package omnix.ai.draw;

class OmnixDrawPipeline {
    public var stages:Array<String>;

    public function new() {
        stages = [
            "reference",
            "segmentation",
            "parts",
            "rig",
            "poses",
            "expressions",
            "animation",
            "spritesheet",
            "atlas_xml",
            "preview",
            "export"
        ];
    }

    public function describe():String {
        return stages.join(" -> ");
    }
}
