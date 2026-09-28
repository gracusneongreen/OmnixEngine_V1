package omnix.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxTypedGroup;
import omnix.ai.OmnixAIChat;
import omnix.ai.OmnixAIContext;

/**
 * Lightweight in-engine Omnix AI Chat panel.
 * The host state can add this group to its display list.
 */
class OmnixAIChatPanel extends FlxTypedGroup<FlxSprite> {
    public var chat:OmnixAIChat;
    public var context:OmnixAIContext;
    public var question:String = "";

    var title:FlxText;
    var log:FlxText;
    var input:FlxText;
    var status:FlxText;

    public function new(x:Float = 24, y:Float = 24, width:Int = 520, height:Int = 300) {
        super();
        chat = new OmnixAIChat();
        context = new OmnixAIContext();

        var bg = new FlxSprite(x, y);
        bg.makeGraphic(width, height, 0xDD111111);
        add(bg);

        title = new FlxText(x + 16, y + 12, width - 32, "OMNIX AI CHAT");
        title.size = 20;
        add(title);

        log = new FlxText(x + 16, y + 48, width - 32, "Ask OmnixFNF-AI a question...");
        log.size = 14;
        log.wordWrap = true;
        add(log);

        input = new FlxText(x + 16, y + height - 54, width - 32, "> ");
        input.size = 16;
        add(input);

        status = new FlxText(x + 16, y + height - 24, width - 32, "LOCAL AI: ready");
        status.size = 11;
        add(status);
    }

    public function ask(text:String):Void {
        if (text == null || StringTools.trim(text) == "") return;
        question = text;
        status.text = "LOCAL AI: thinking...";
        log.text = "You: " + text + "\n\nOmnixFNF-AI is answering...";

        chat.ask(context.toPrompt() + "\nUser question: " + text, function(answer:String) {
            log.text = "You: " + text + "\n\nAI: " + answer;
            status.text = "LOCAL AI: ready";
        }, function(error:String) {
            log.text = "You: " + text + "\n\nAI ERROR: " + error;
            status.text = "LOCAL AI: offline / check server";
        });
    }

    public function clearChat():Void {
        chat.clear();
        log.text = "Ask OmnixFNF-AI a question...";
        status.text = "LOCAL AI: ready";
    }
}