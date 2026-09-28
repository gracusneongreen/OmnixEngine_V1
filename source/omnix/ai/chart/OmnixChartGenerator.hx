package omnix.ai.chart;

class OmnixChartGenerator {
    public var bpm:Float = 100;

    public function new() {}

    public function stepAt(timeMs:Float):Int {
        if (bpm <= 0) return 0;
        return Math.floor((timeMs / 60000.0) * bpm * 4);
    }

    public function generate(difficulty:String):Array<Dynamic> return [];
}
