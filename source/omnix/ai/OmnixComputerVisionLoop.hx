package omnix.ai;

import omnix.ai.computer.OmnixComputerAction;
import omnix.ai.computer.OmnixComputerAgentLoop;
import omnix.ai.computer.OmnixComputerUse;
import omnix.ai.vision.OmnixVisionProvider;

class OmnixComputerVisionLoop {
    public var provider:OmnixAIProvider;
    public var computer:OmnixComputerUse;
    public var vision:OmnixVisionProvider;
    public var loop:OmnixComputerAgentLoop;
    public var maxSteps:Int = 20;

    public function new(?provider:OmnixAIProvider, ?computer:OmnixComputerUse, ?vision:OmnixVisionProvider) {
        this.provider = provider == null ? new OmnixAIProvider() : provider;
        this.computer = computer == null ? new OmnixComputerUse() : computer;
        this.vision = vision == null ? new OmnixVisionProvider() : vision;
        this.loop = new OmnixComputerAgentLoop(this.computer);
        this.loop.maxSteps = maxSteps;
    }

    public function start(goal:String, callback:Bool->String->Void):Void {
        loop.start();
        computer.connect(function(ok:Bool, message:String) {
            if (!ok) { callback(false, message); return; }
            askAI(goal, "", callback);
        });
    }

    function askAI(goal:String, observation:String, callback:Bool->String->Void):Void {
        if (!loop.canContinue()) { callback(false, "MAX_STEPS_REACHED"); return; }

        var prompt = "You are Omnix Computer Use Agent. Goal: " + goal
            + "\nObservation: " + observation
            + "\nReturn ONLY JSON: {"tool":"computer","action":"click|double_click|type|key|scroll|move|wait|screenshot","arguments":{...}}";
        provider.chat(prompt, function(raw:String) {
            var call:Dynamic = OmnixAIToolParser.parseComputerCall(raw);
            if (call == null) { callback(false, "INVALID_TOOL_CALL"); return; }
            if (call.tool != "computer") { callback(false, "UNSUPPORTED_TOOL"); return; }

            var action = new OmnixComputerAction(Std.string(call.action));
            var args:Dynamic = call.arguments;
            if (args != null) {
                if (Reflect.hasField(args, "x")) action.x = Std.int(args.x);
                if (Reflect.hasField(args, "y")) action.y = Std.int(args.y);
                if (Reflect.hasField(args, "text")) action.text = Std.string(args.text);
                if (Reflect.hasField(args, "key")) action.key = Std.string(args.key);
            }
            action.approved = true;
            loop.nextStep();
            computer.execute(action, function(result) {
                if (!result.ok) { callback(false, result.message); return; }
                computer.screenshot(function(screen) {
                    analyzeAndAsk(goal, screen.screenshot, callback);
                });
            });
        }, function(error:String) callback(false, error));
    }
}
