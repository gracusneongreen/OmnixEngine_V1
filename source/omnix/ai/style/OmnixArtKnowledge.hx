package omnix.ai.style;

class OmnixArtKnowledge {
    public var bible:OmnixArtBible;

    public function new(bible:OmnixArtBible) {
        this.bible = bible;
    }

    public function buildGenerationContext(assetType:String):String {
        var result = "ART BIBLE: " + bible.name + "\n";
        result += "asset_type=" + assetType + "\n";
        result += "line_weight=" + bible.lineWeight + "\n";
        result += "shading=" + bible.shading + "\n";
        result += "lighting=" + bible.lighting + "\n";
        result += "perspective=" + bible.perspective + "\n";
        result += "scale=" + bible.scaleRule + "\n";
        result += "palette=" + bible.palette.join(",") + "\n";
        result += "brushes=" + bible.brushProfiles.length + "\n";
        result += "style_refs=" + bible.styleReferences.length + "\n";
        result += "character_refs=" + bible.characterReferences.length + "\n";
        result += "background_refs=" + bible.backgroundReferences.length + "\n";
        return result;
    }
}
