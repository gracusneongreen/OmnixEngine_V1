package omnix.lang;

class OmnixLanguageSpec {
    public var id:String;
    public var extension:String;
    public var purpose:String;
    public var runtime:String;
    public var sandboxed:Bool;

    public function new(id:String, extension:String, purpose:String, runtime:String, sandboxed:Bool = true) {
        this.id = id;
        this.extension = extension;
        this.purpose = purpose;
        this.runtime = runtime;
        this.sandboxed = sandboxed;
    }

    public static function defaults():Array<OmnixLanguageSpec> {
        return [
            new OmnixLanguageSpec("haxe", ".hx", "Native engine implementation", "compiled"),
            new OmnixLanguageSpec("python", ".py", "AI tools, automation and offline generators", "external"),
            new OmnixLanguageSpec("javascript", ".js", "Web tools, UI and integrations", "external"),
            new OmnixLanguageSpec("omnixscript", ".omx", "Fast FNF mod scripting and gameplay logic", "omnix-vm"),
            new OmnixLanguageSpec("omnixai", ".oai", "Declarative AI agent tasks and tool plans", "omnix-agent"),
            new OmnixLanguageSpec("omnixflow", ".oflow", "Visual-style pipelines for assets, animation, charts and builds", "omnix-flow")
        ];
    }
}
