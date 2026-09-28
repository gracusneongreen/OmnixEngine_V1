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
    public var window:OmnixAIChatWindow;
    public var input:OmnixAIInputController;
    public var context:OmnixAIContext;

    public static function attach(state:FlxState):OmnixAIIntegration {
        var integration = new OmnixAIIntegration();
        state.add(integration.window);
        return integration;
    }

    public function new() {
        window = new OmnixAIChatWindow();
        input = new OmnixAIInputController(cast window);
        context = window.context;
    }

    public function update():Void {
        input.update();
    }

    public function ask(question:String):Void {
        window.input.text = question;
        window.sendButton.onUp.callback();
    }

    public function open():Void {
        input.open();
    }

    public function close():Void {
        input.close();
    }
}
