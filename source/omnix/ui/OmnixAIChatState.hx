package omnix.ui;

import flixel.FlxState;

/**
 * Optional standalone state for testing the Omnix AI Chat UI.
 * It is not wired into the main menu automatically.
 */
class OmnixAIChatState extends FlxState {
    public var center:OmnixAICenter;
    var initialTab:String;

    public function new(?initialTab:String = OmnixAICenter.CHAT) {
        super();
        this.initialTab = initialTab;
    }

    override public function create():Void {
        super.create();
        center = new OmnixAICenter();
        center.selectTab(initialTab);
        add(center);
    }
}
