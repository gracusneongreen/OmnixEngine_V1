package omnix.ai.computer;

import omnix.ai.computer.OmnixComputerUse.OmnixComputerResult;

class OmnixComputerAgent {
    public var computer:OmnixComputerUse;
    public var context:OmnixComputerContext;
    public var autonomy:Bool;

    public function new(?computer:OmnixComputerUse) {
        this.computer = computer != null ? computer : new OmnixComputerUse();
        this.context = new OmnixComputerContext();
        this.autonomy = false;
    }

    public function connect(onDone:Bool->String->Void):Void {
        computer.connect(function(ok:Bool, message:String) {
            context.connected = ok;
            onDone(ok, message);
        });
    }

    public function takeScreenshot(onDone:OmnixComputerResult->Void):Void {
        computer.screenshot(function(result) {
            if (result.ok) context.lastScreenshot = result.screenshot;
            onDone(result);
        });
    }

    public function requestInstall(app:String, approved:Bool, onDone:OmnixComputerResult->Void):Void {
        var action = new OmnixComputerAction(OmnixComputerActionType.INSTALL_APP);
        action.target = app;
        action.approved = approved;
        computer.execute(action, onDone);
    }
}
