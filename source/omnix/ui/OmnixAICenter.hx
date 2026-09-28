package omnix.ui;

import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import omnix.ai.OmnixAIMode;
import omnix.ai.OmnixAIModeChat;

class OmnixAICenter extends FlxTypedGroup<FlxBasic> {
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

        info = new FlxText(x + 20, y + 48, width - 40, "FNF specialist AI // local model // LM Studio / vLLM");
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

    function modeForTab(tab:String):String {
        if (tab == CODE) return OmnixAIMode.CODE;
        if (tab == MOD) return OmnixAIMode.MOD;
        if (tab == DEBUG) return OmnixAIMode.DEBUG;
        if (tab == DRAW) return OmnixAIMode.DRAW;
        if (tab == CHART) return OmnixAIMode.CHART;
        return OmnixAIMode.CHAT;
    }

    public function selectTab(tab:String):Void {
        activeTab = tab;
        chat.visible = true;
        chat.active = true;
        chat.setMode(modeForTab(tab));

        if (tab == CHAT) info.text = "CHAT // General OmnixFNF-AI assistant.";
        else if (tab == CODE) info.text = "CODE // Haxe / Lua / FNF code specialist.";
        else if (tab == MOD) info.text = "MOD GENERATOR // Characters, stages, events, assets.";
        else if (tab == DEBUG) info.text = "DEBUG // Errors, logs, files and concrete fixes.";
        else if (tab == DRAW) info.text = "DRAW AI // FNF assets, poses, parts and animation rigs.";
        else if (tab == CHART) info.text = "CHART AI // BPM, timing, notes, sections and charts.";
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