package omnix.ui;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * Omnix AI Center shell.
 *
 * Tabs:
 * CHAT       - ask OmnixFNF-AI questions
 * CODE       - coding assistant
 * MOD        - mod-generation assistant
 * DEBUG      - project/error diagnostics
 * DRAW AI    - future asset/animation workflow
 * CHART AI   - future chart-generation workflow
 *
 * The tab system is intentionally lightweight so it can run on the
 * same Flixel foundation as the rest of OmnixEngine.
 */
class OmnixAICenter extends FlxTypedGroup<FlxSprite> {
    public static inline var CHAT:String = "CHAT";
    public static inline var CODE:String = "CODE";
    public static inline var MOD:String = "MOD";
    public static inline var DEBUG:String = "DEBUG";
    public static inline var DRAW:String = "DRAW AI";
    public static inline var CHART:String = "CHART AI";

    public var activeTab:String = CHAT;
    public var chat:OmnixAIChatWindow;

    var background:FlxSprite;
    var title:FlxText;
    var tabButtons:Array<FlxButton>;
    var info:FlxText;

    public function new(x:Float = 20, y:Float = 20, width:Int = 900, height:Int = 560) {
        super();

        background = new FlxSprite(x, y);
        background.makeGraphic(width, height, 0xF00B0B10);
        add(background);

        title = new FlxText(x + 20, y + 14, width - 40, "OMNIX AI CENTER");
        title.size = 24;
        add(title);

        info = new FlxText(x + 20, y + 48, width - 40,
            "FNF specialist AI // local model // LM Studio / vLLM");
        info.size = 12;
        add(info);

        tabButtons = [];
        var names = [CHAT, CODE, MOD, DEBUG, DRAW, CHART];
        var buttonX = x + 20;

        for (name in names) {
            var b = new FlxButton(buttonX, y + 72, name, function() selectTab(name));
            b.setSize(125, 32);
            add(b);
            tabButtons.push(b);
            buttonX += 135;
        }

        chat = new OmnixAIChatWindow(x + 20, y + 118, width - 40, height - 145);
        add(chat);

        selectTab(CHAT);
    }

    public function selectTab(tab:String):Void {
        activeTab = tab;
        chat.visible = tab == CHAT;
        chat.active = tab == CHAT;

        if (tab == CHAT) {
            info.text = "CHAT // Ask OmnixFNF-AI anything about your FNF project.";
        } else if (tab == CODE) {
            info.text = "CODE // Generate and explain FNF / Haxe / Lua code.";
        } else if (tab == MOD) {
            info.text = "MOD GENERATOR // Plan characters, stages, events and assets.";
        } else if (tab == DEBUG) {
            info.text = "DEBUG // Analyze errors and project context.";
        } else if (tab == DRAW) {
            info.text = "DRAW AI // Asset and animation AI workflow.";
        } else if (tab == CHART) {
            info.text = "CHART AI // BPM, notes, sections and chart generation.";
        }
    }

    public function open():Void {
        visible = true;
        active = true;
    }

    public function close():Void {
        visible = false;
        active = false;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE) close();
    }
}