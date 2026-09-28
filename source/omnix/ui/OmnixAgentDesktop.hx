package omnix.ui;

import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxInputText;
import omnix.ai.computer.OmnixComputerAgent;
import omnix.ai.computer.OmnixComputerResult;
import omnix.ai.computer.OmnixScreenPeek;

class OmnixAgentDesktop extends FlxTypedGroup<FlxSprite> {
    public var agent:OmnixComputerAgent;
    public var screenPeek:OmnixScreenPeek;
    public var status:FlxText;
    public var transcript:FlxText;
    public var input:FlxInputText;

    var screen:FlxSprite;
    var screenLabel:FlxText;
    var lines:Array<String> = [];
    var screenX:Float;
    var screenY:Float;
    var screenW:Int;
    var screenH:Int;

    public function new(x:Float = 20, y:Float = 20, width:Int = 900, height:Int = 600) {
        super();
        agent = new OmnixComputerAgent();
        screenPeek = new OmnixScreenPeek();

        var bg = new FlxSprite(x, y);
        bg.makeGraphic(width, height, 0xF0121218);
        add(bg);

        var title = new FlxText(x + 18, y + 12, width - 36, "OMNIX AGENT DESKTOP  //  REAL COMPUTER USE");
        title.size = 20;
        add(title);

        screenX = x + 18;
        screenY = y + 52;
        screenW = width - 36;
        screenH = 330;

        screen = new FlxSprite(screenX, screenY);
        screen.makeGraphic(screenW, screenH, 0xFF050507);
        add(screen);

        screenLabel = new FlxText(screenX + 12, screenY + 12, screenW - 24,
            "SCREEN PEEK // waiting for screenshot");
        screenLabel.size = 13;
        add(screenLabel);

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
                /*
                 * The current Computer Host returns screenshot data to the agent layer.
                 * Screen Peek stores that payload. Actual PNG decoding/rendering is kept
                 * isolated here so the UI can later use OpenFL/Flixel bitmap decoding.
                 */
                if (result.data != null) {
                    var payload:Dynamic = result.data;
                    var base64:String = payload.imageBase64 != null ? Std.string(payload.imageBase64) : "";
                    var mime:String = payload.mimeType != null ? Std.string(payload.mimeType) : "image/png";
                    var w:Int = payload.width != null ? Std.int(payload.width) : 0;
                    var h:Int = payload.height != null ? Std.int(payload.height) : 0;

                    if (base64 != "") {
                        screenPeek.setImage(base64, mime, w, h);
                        screenLabel.text = "SCREEN PEEK // LIVE IMAGE RECEIVED"
                            + "\n" + mime + " " + w + "x" + h;
                    } else {
                        screenLabel.text = "SCREEN PEEK // screenshot received (no image payload)";
                    }
                } else {
                    screenLabel.text = "SCREEN PEEK // screenshot received";
                }

                addLine("SCREENSHOT: received from agent desktop.");
                status.text = "COMPUTER: SCREEN PEEK READY";
            } else {
                addLine("SCREENSHOT ERROR: " + result.message);
                status.text = "COMPUTER: screenshot error";
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