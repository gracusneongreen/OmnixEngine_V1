package omnix.ui;

import flixel.FlxState;
import omnix.ai.OmnixAIContext;

/**
 * Drop-in helper for PlayState or another FlxState.
 *
 * Example:
 * var ai = OmnixAIIntegration.attach(this);
 * ai.context.song = "my-song";
 * ai.context.character = "gracusneongreen";
 *
 * Call ai.update() from update().
 * Press F8 to open/close the chat.
 */
class OmnixAIIntegration {
    public var panel:OmnixAIChatPanel;
    public var input:OmnixAIInputController;
    public var context:OmnixAIContext;

    public static function attach(state:FlxState):OmnixAIIntegration {
        var integration = new OmnixAIIntegration();
        state.add(integration.panel);
        return integration;
    }

    public function new() {
        panel = new OmnixAIChatPanel();
        input = new OmnixAIInputController(panel);
        context = panel.context;
    }

    public function update():Void {
        input.update();
    }

    public function ask(question:String):Void {
        panel.ask(question);
    }

    public function open():Void {
        input.open();
    }

    public function close():Void {
        input.close();
    }
}