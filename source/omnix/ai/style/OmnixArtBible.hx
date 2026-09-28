package omnix.ai.style;

class OmnixArtBible {
    public var name:String;
    public var styleReferences:Array<OmnixArtReference>;
    public var characterReferences:Array<OmnixArtReference>;
    public var backgroundReferences:Array<OmnixArtReference>;
    public var brushProfiles:Array<OmnixBrushProfile>;
    public var palette:Array<String>;
    public var lineWeight:String;
    public var shading:String;
    public var lighting:String;
    public var perspective:String;
    public var scaleRule:String;
    public var negativeRules:Array<String>;

    public function new(name:String = "Omnix Art Bible") {
        this.name = name;
        styleReferences = [];
        characterReferences = [];
        backgroundReferences = [];
        brushProfiles = [];
        palette = [];
        lineWeight = "";
        shading = "";
        lighting = "";
        perspective = "";
        scaleRule = "";
        negativeRules = [];
    }

    public function addReference(reference:OmnixArtReference):Void {
        switch (reference.kind) {
            case "character": characterReferences.push(reference);
            case "background": backgroundReferences.push(reference);
            default: styleReferences.push(reference);
        }
    }

    public function addBrush(profile:OmnixBrushProfile):Void {
        brushProfiles.push(profile);
    }
}
