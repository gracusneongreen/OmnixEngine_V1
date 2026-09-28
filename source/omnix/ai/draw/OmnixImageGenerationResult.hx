package omnix.ai.draw;

typedef OmnixImageGenerationResult = {
    var ok:Bool;
    var message:String;
    @:optional var imagePath:String;
    @:optional var imageBase64:String;
}
