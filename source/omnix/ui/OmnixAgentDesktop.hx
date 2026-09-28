package omnix.ui;

import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxInputText;
import omnix.ai.computer.OmnixComputerAgent;
import omnix.ai.computer.OmnixComputerResult;

class OmnixAgentDesktop extends FlxTypedGroup<FlxSprite> {
    public var agent:OmnixComputerAgent;
    public var status:FlxText;
    public var transcript:FlxText;
    public var input:FlxInputText;

    var lines:Array<String> = [];

    public function new(x:Float = 20, y:Float = 20, width:Int = 900, height:Int = 600) {
        super();
        agent = new OmnixComputerAgent();

        var bg = new FlxSprite(x, y);
        bg.makeGraphic(width, height, 0xF0121218);
        add(bg);

        var title = new FlxText(x + 18, y + 12, width - 36, "OMNIX AGENT DESKTOP  //  REAL COMPUTER USE");
        title.size = 20;
        add(title);

        var screen = new FlxSprite(x + 18, y + 52);
        screen.makeGraphic(width - 36, 330, 0xFF050507);
        add(screen);

        status = new FlxText(x + 18, y + 390, width - 130, "COMPUTER: offline");
        status.size = 12;
        add(status);

        transcript = new FlxText(x + 18, y + 420, width - 36, "Agent desktop ready.");
        transcript.size = 12;
        transcript.wordWrap = true;
        add(transcript);

        input = new FlxInputText(x + 18, y + height - 52, width - 190, 32, "");
        input.size = 15;
        add(input);

        var send = new FlxButton(x + width - 158, y + height - 52, "SEND", sendCommand);
        send.setSize(64, 32);
        add(send);

        var connect = new FlxButton(x + width - 90, y + 390, "CONNECT", connect);
        connect.setSize(72, 28);
        add(connect);

        var screenButton = new FlxButton(x + width - 90, y + 420, "SCREEN", takeScreenshot);
        screenButton.setSize(72, 28);
        add(screenButton);
    }

    public function connect():Void {
        status.text = "COMPUTER: connecting...";
        agent.connect(function(ok:Bool, message:String) {
            status.text = ok ? "COMPUTER: ONLINE" : "COMPUTER: OFFLINE";
            addLine((ok ? "SYSTEM: " : "ERROR: ") + message);
        });
    }

    public function takeScreenshot():Void {
        agent.takeScreenshot(function(result:OmnixComputerResult) {
            if (result.ok) {
                addLine("SCREENSHOT: received from agent desktop.");
                status.text = "COMPUTER: screenshot received";
            } else {
                addLine("SCREENSHOT ERROR: " + result.message);
            }
        });
    }

    public function sendCommand():Void {
        var command = StringTools.trim(input.text);
        if (command == "") return;
        input.text = "";
        addLine("You: " + command);
        addLine("AI: command routing is ready.");
    }

    function addLine(line:String):Void {
        lines.push(line);
        while (lines.length > 8) lines.shift();
        transcript.text = lines.join("\n\n");
    }
}