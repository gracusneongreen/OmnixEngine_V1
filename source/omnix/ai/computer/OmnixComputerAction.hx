package omnix.ai.computer;

enum abstract OmnixComputerActionType(String) from String to String {
    var SCREENSHOT = "screenshot";
    var CLICK = "click";
    var DOUBLE_CLICK = "double_click";
    var TYPE = "type";
    var KEY = "key";
    var SCROLL = "scroll";
    var MOVE = "move";
    var WAIT = "wait";
    var OPEN_APP = "open_app";
    var INSTALL_APP = "install_app";
    var RUN_COMMAND = "run_command";
}

class OmnixComputerAction {
    public var type:String;
    public var x:Int;
    public var y:Int;
    public var text:String;
    public var key:String;
    public var target:String;
    public var command:String;
    public var approved:Bool;

    public function new(type:String) {
        this.type = type;
        this.x = 0;
        this.y = 0;
        this.text = "";
        this.key = "";
        this.target = "";
        this.command = "";
        this.approved = false;
    }
}
