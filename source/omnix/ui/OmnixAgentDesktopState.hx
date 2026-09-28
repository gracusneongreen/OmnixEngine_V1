package omnix.ui;

import flixel.FlxState;

class OmnixAgentDesktopState extends FlxState {
    public var desktop:OmnixAgentDesktop;

    override public function create():Void {
        super.create();
        desktop = new OmnixAgentDesktop();
        add(desktop);
    }
}