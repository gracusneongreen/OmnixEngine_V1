package omnix.ai.vision;

typedef OmnixVisionResult = {
    var ok:Bool;
    var message:String;
    @:optional var description:String;
    @:optional var text:String;
}
