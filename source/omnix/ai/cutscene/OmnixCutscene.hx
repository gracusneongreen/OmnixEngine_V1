package omnix.ai.cutscene;

class OmnixCutscene {
    public var id:String;
    public var title:String;
    public var lines:Array<OmnixCutsceneLine>;
    public var cameraPlan:Array<String>;
    public var animationPlan:Array<String>;
    public var soundPlan:Array<String>;
    public var gameEvents:Array<String>;

    public function new(id:String, title:String = "") {
        this.id = id;
        this.title = title;
        lines = [];
        cameraPlan = [];
        animationPlan = [];
        soundPlan = [];
        gameEvents = [];
    }

    public function addLine(line:OmnixCutsceneLine):Void {
        lines.push(line);
    }
}
