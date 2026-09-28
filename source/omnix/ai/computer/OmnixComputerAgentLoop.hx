package omnix.ai.computer;

class OmnixComputerAgentLoop {
    public var computer:OmnixComputerUse;
    public var maxSteps:Int = 20;
    public var step:Int = 0;
    public var running:Bool = false;

    public function new(?computer:OmnixComputerUse) {
        this.computer = computer == null ? new OmnixComputerUse() : computer;
    }

    public function start():Void {
        step = 0;
        running = true;
    }

    public function stop():Void {
        running = false;
    }

    public function canContinue():Bool {
        return running && step < maxSteps;
    }

    public function nextStep():Void {
        if (step < maxSteps) step++;
        if (step >= maxSteps) running = false;
    }
}
