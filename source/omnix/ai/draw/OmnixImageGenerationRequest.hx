package omnix.ai.draw;

typedef OmnixImageGenerationRequest = {
    var prompt:String;
    @:optional var negativePrompt:String;
    @:optional var width:Int;
    @:optional var height:Int;
    @:optional var steps:Int;
    @:optional var guidanceScale:Float;
    @:optional var seed:Int;
    @:optional var outputPath:String;
    @:optional var styleAdapter:String;
    @:optional var characterAdapter:String;
    @:optional var backgroundAdapter:String;
}
