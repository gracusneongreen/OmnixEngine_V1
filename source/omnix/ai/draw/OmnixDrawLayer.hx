package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixDrawLayer {
    public var id:String;
    public var omnixId:String;
    public var partId:String;
    public var assetPath:String;
    public var visible:Bool;
    public var alpha:Float;
    public var zIndex:Int;
    public var width:Int;
    public var height:Int;
    public var transform:OmnixDrawTransform;

    public function new(id:String, partId:String, ?assetPath:String = "") {
        this.id = id;
        this.omnixId = OmnixID.make("LAYER", id + ":" + partId);
        this.partId = partId;
        this.assetPath = assetPath;
        visible = true;
        alpha = 1;
        zIndex = 0;
        width = 0;
        height = 0;
        transform = new OmnixDrawTransform();
    }
}
