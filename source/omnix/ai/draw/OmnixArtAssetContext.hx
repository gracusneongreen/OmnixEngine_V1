package omnix.ai.draw;

import omnix.ai.style.OmnixArtBible;
import omnix.ai.style.OmnixArtKnowledge;

class OmnixArtAssetContext {
    public var artBible:OmnixArtBible;
    public var knowledge:OmnixArtKnowledge;

    public function new(?artBible:OmnixArtBible) {
        this.artBible = artBible == null ? new OmnixArtBible() : artBible;
        knowledge = new OmnixArtKnowledge(this.artBible);
    }

    public function promptContext(assetType:String):String {
        return knowledge.buildGenerationContext(assetType);
    }
}
