package omnix.ai.chart;

import omnix.core.OmnixID;

class OmnixChartAI {
    public var omnixId:String;
    public var bpm:Float;
    public var difficulty:String;

    public function new(?bpm:Float = 100, ?difficulty:String = "hard") {
        omnixId = OmnixID.random("CHART_AI");
        this.bpm = bpm;
        this.difficulty = difficulty;
    }

    public function beatToSeconds(beat:Float):Float return (60 / bpm) * beat;
    public function secondsToBeat(seconds:Float):Float return seconds / (60 / bpm);
}
