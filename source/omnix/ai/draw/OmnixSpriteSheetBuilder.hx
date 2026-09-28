package omnix.ai.draw;

import omnix.core.OmnixID;

class OmnixSpriteSheetBuilder {
    public var omnixId:String;
    public var frameWidth:Int;
    public var frameHeight:Int;
    public var columns:Int;
    public var rows:Int;
    public var frameNames:Array<String>;

    public function new(frameWidth:Int = 512, frameHeight:Int = 512, columns:Int = 1, rows:Int = 1) {
        omnixId = OmnixID.random("SPRITESHEET");
        this.frameWidth = frameWidth;
        this.frameHeight = frameHeight;
        this.columns = columns;
        this.rows = rows;
        frameNames = [];
    }

    public function addFrame(name:String):Void frameNames.push(name);
    public function capacity():Int return columns * rows;
}
