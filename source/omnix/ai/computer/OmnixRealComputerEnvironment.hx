package omnix.ai.computer;

/**
 * Real computer execution environment.
 *
 * This is the engine-side contract for a host-controlled desktop/sandbox.
 * The actual OS interaction is delegated to the Omnix Computer Host.
 */
class OmnixRealComputerEnvironment {
    public var endpoint:String;
    public var connected:Bool;
    public var environmentName:String;
    public var approvalRequired:Bool;
    public var isolated:Bool;

    public function new(
        ?endpoint:String = "http://127.0.0.1:8765",
        ?environmentName:String = "Omnix Desktop Sandbox",
        ?isolated:Bool = true
    ) {
        this.endpoint = endpoint;
        this.environmentName = environmentName;
        this.isolated = isolated;
        this.connected = false;
        this.approvalRequired = true;
    }

    public function connect():Void {
        connected = true;
    }

    public function disconnect():Void {
        connected = false;
    }

    public function canExecute(action:OmnixComputerAction):Bool {
        if (!connected) return false;
        return !approvalRequired || action.requiresApproval();
    }

    public function describe():String {
        return environmentName
            + " | endpoint=" + endpoint
            + " | isolated=" + isolated
            + " | approval=" + approvalRequired;
    }
}
