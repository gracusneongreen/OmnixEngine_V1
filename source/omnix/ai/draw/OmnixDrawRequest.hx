package omnix.ai.draw;

typedef OmnixDrawRequest = {
    var prompt:String;
    @:optional var sourceImage:String;
    @:optional var characterName:String;
    @:optional var pose:String;
    @:optional var transparent:Bool;
}
