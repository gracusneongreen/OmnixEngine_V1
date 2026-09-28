package omnix.ai.computer;

import haxe.Http;
import haxe.Json;
import omnix.ai.computer.OmnixComputerAction.OmnixComputerActionType;

typedef OmnixComputerResult = {
    var ok:Bool;
    var message:String;
    var screenshot:String;
    var data:Dynamic;
}

class OmnixComputerUse {
    public var baseUrl:String;
    public var sessionId:String;
    public var requireApproval:Bool;
    public var connected:Bool;

    public function new(?baseUrl:String = "http://127.0.0.1:8765", ?requireApproval:Bool = true) {
        this.baseUrl = baseUrl;
        this.requireApproval = requireApproval;
        this.sessionId = "";
        this.connected = false;
    }

    public function connect(onDone:Bool->String->Void):Void {
        request("/health", {method: "GET"}, function(result) {
            connected = result.ok;
            onDone(result.ok, result.message);
        });
    }

    public function screenshot(onDone:OmnixComputerResult->Void):Void {
        request("/computer/screenshot", {method: "POST", session_id: sessionId}, onDone);
    }

    public function execute(action:OmnixComputerAction, onDone:OmnixComputerResult->Void):Void {
        if (requireApproval && !action.approved) {
            onDone({
                ok: false,
                message: "ACTION_REQUIRES_APPROVAL",
                screenshot: "",
                data: null
            });
            return;
        }

        request("/computer/action", {
            method: "POST",
            session_id: sessionId,
            action: action
        }, onDone);
    }

    public function installApp(target:String, onDone:OmnixComputerResult->Void):Void {
        var action = new OmnixComputerAction(OmnixComputerActionType.INSTALL_APP);
        action.target = target;
        execute(action, onDone);
    }

    public function runCommand(command:String, approved:Bool, onDone:OmnixComputerResult->Void):Void {
        var action = new OmnixComputerAction(OmnixComputerActionType.RUN_COMMAND);
        action.command = command;
        action.approved = approved;
        execute(action, onDone);
    }

    function request(path:String, payload:Dynamic, onDone:OmnixComputerResult->Void):Void {
        var http = new Http(baseUrl + path);
        var body = Json.stringify(payload);
        http.setHeader("Content-Type", "application/json");
        http.setHeader("Accept", "application/json");
        http.onData = function(raw:String) {
            try {
                var data:Dynamic = Json.parse(raw);
                onDone({
                    ok: data.ok == true,
                    message: data.message != null ? Std.string(data.message) : "",
                    screenshot: data.screenshot != null ? Std.string(data.screenshot) : "",
                    data: data
                });
            } catch (e:Dynamic) {
                onDone({
                    ok: false,
                    message: "Invalid computer-use response: " + Std.string(e),
                    screenshot: "",
                    data: null
                });
            }
        };
        http.onError = function(error:String) {
            onDone({
                ok: false,
                message: error,
                screenshot: "",
                data: null
            });
        };

        if (payload.method == "GET") {
            http.request(false);
        } else {
            http.setPostData(body);
            http.request(true);
        }
    }
}
