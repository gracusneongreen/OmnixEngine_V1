package omnix.animation;

class OmnixAnimationGraph {
    public var current:String = "";
    public var previous:String = "";
    public function new() {}
    public function play(name:String):Void {
        if (name == current) return;
        previous = current;
        current = name;
    }
    public function reset():Void { previous = ""; current = ""; }
}
