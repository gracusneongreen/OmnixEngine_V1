package omnix.ui;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

/**
 * Keyboard/touch-friendly controller for opening the Omnix AI Chat.
 * F8 toggles the chat on desktop; hosts may also call toggle().
 */
class OmnixAIInputController {
    public var panel:OmnixAIChatPanel;
    public var visible:Bool = false;

    public function new(panel:OmnixAIChatPanel) {
        this.panel = panel;
        panel.visible = false;
    }

    public function update():Void {
        if (FlxG.keys.justPressed.F8) toggle();
    }

    public function toggle():Void {
        visible = !visible;
        panel.visible = visible;
        panel.active = visible;
    }

    public function open():Void {
        visible = true;
        panel.visible = true;
        panel.active = true;
    }

    public function close():Void {
        visible = false;
        panel.visible = false;
        panel.active = false;
    }
}