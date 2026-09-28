package omnix.rhythm;

class OmnixRhythmCore {
    public var bpm:Float = 100;
    public var crochet:Float = 600;
    public var stepCrochet:Float = 150;
    public function new(initialBpm:Float = 100) setBPM(initialBpm);
    public function setBPM(value:Float):Void {
        bpm = value <= 0 ? 100 : value;
        crochet = 60000 / bpm;
        stepCrochet = crochet / 4;
    }
    public function beatAt(songPositionMs:Float):Float return songPositionMs / crochet;
    public function stepAt(songPositionMs:Float):Float return songPositionMs / stepCrochet;
}
