package omnix.ai;

class OmnixAgentBrain {
    public var goal:String = "";
    public var phase:String = "idle";
    public var steps:Array<String> = [];

    public function new() {}

    public function start(task:String):Void {
        goal = task;
        phase = "planning";
        steps = [];
    }

    public function addStep(step:String):Void {
        steps.push(step);
        phase = "executing";
    }

    public function finish():Void {
        phase = "complete";
    }
}
