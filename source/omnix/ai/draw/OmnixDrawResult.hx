package omnix.ai.draw;

typedef OmnixDrawResult = {
    var ok:Bool;
    var message:String;
    @:optional var imagePath:String;
    @:optional var metadataPath:String;
}
