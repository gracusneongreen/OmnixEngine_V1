package omnix.ui;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxInputText;
import omnix.ai.OmnixAIMode;
import omnix.ai.OmnixAIModeChat;
import omnix.ai.OmnixAIContext;

class OmnixAIChatWindow extends FlxTypedGroup<FlxSprite> {
    public var chat:OmnixAIModeChat;
    public var context:OmnixAIContext;
    public var input:FlxInputText;
    public var sendButton:FlxButton;
    public var transcript:FlxText;
    public var status:FlxText;

    var historyLines:Array<String> = [];

    public function new(x:Float = 24, y:Float = 24, width:Int = 700, height:Int = 420) {
        super();
        chat = new OmnixAIModeChat(OmnixAIMode.CHAT);
        context = chat.context;

        var background = new FlxSprite(x, y);
        background.makeGraphic(width, height, 0xEE0B0B0F);
        add(background);

        var header = new FlxText(x + 16, y + 12, width - 32, "OMNIX AI CHAT  //  OmnixFNF-AI");
        header.size = 20;
        add(header);

        transcript = new FlxText(x + 16, y + 50, width - 32, "OmnixFNF-AI ready. Mode: CHAT");
        transcript.size = 14;
        transcript.wordWrap = true;
        add(transcript);

        input = new FlxInputText(x + 16, y + height - 64, width - 140, 34, "");
        input.size = 16;
        input.hasFocus = true;
        add(input);

        sendButton = new FlxButton(x + width - 112, y + height - 64, "SEND", sendCurrent);
        sendButton.setSize(96, 34);
        add(sendButton);

        status = new FlxText(x + 16, y + height - 24, width - 32, "LOCAL AI: ready");
        status.size = 11;
        add(status);
    }

    public function setMode(mode:String):Void {
        chat.setMode(mode);
        status.text = "LOCAL AI: mode = " + mode;
        addLine("SYSTEM: switched to " + mode.toUpperCase() + " mode.");
    }

    public function sendCurrent():Void {
        var question = StringTools.trim(input.text);
        if (question == "") return;
        input.text = "";
        addLine("You: " + question);
        status.text = "LOCAL AI: thinking...";

        chat.ask(question,
            function(answer:String) {
                addLine("AI: " + answer);
                status.text = "LOCAL AI: ready";
            },
            function(error:String) {
                addLine("AI ERROR: " + error);
                status.text = "LOCAL AI: offline / check LM Studio or vLLM";
            });
    }

    function addLine(line:String):Void {
        historyLines.push(line);
        while (historyLines.length > 12) historyLines.shift();
        transcript.text = historyLines.join("\n\n");
    }

    public function clearChat():Void {
        chat.clear();
        historyLines = [];
        transcript.text = "OmnixFNF-AI ready. Mode: " + Std.string(chat.mode).toUpperCase();
        status.text = "LOCAL AI: ready";
        input.text = "";
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        if (FlxG.keys.justPressed.ENTER && input.hasFocus) sendCurrent();
    }
}