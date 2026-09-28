package omnix.ai.music;

class OmnixMusicAnalyzer {
    public var bpm:Float = 100;
    public var durationMs:Float = 0;

    public function new() {}

    public function beatAt(timeMs:Float):Int {
        if (bpm <= 0) return 0;
        return Math.floor((timeMs / 60000.0) * bpm);
    }
}
