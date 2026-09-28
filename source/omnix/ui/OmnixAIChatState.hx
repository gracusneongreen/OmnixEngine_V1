package omnix.ui;

import flixel.FlxState;

/**
 * Optional standalone state for testing the Omnix AI Chat UI.
 * It is not wired into the main menu automatically.
 */
class OmnixAIChatState extends FlxState {
    var panel:OmnixAIChatPanel;

    override public function create():Void {
        super.create();
        panel = new OmnixAIChatPanel();
        add(panel);
    }
}