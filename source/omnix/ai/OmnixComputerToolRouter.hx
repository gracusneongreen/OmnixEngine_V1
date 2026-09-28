package omnix.ai;

import omnix.ai.computer.OmnixComputerAction;
import omnix.ai.computer.OmnixComputerUse;
import omnix.ai.computer.OmnixComputerResult;

class OmnixComputerToolRouter {
    public var computer:OmnixComputerUse;

    public function new(?computer:OmnixComputerUse) {
        this.computer = computer == null ? new OmnixComputerUse() : computer;
    }

    public function route(action:OmnixComputerAction, callback:OmnixComputerResult->Void):Void {
        computer.execute(action, callback);
    }
}
