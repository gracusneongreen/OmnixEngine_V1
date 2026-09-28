package omnix.testlab;

class OmnixTestLab {
    public var checks:Array<String> = ["build","song-load","chart-load","character-animations","stage","shader","audio-sync"];
    public function new() {}
    public function run():Array<String> return ["Test plan prepared: " + checks.join(", ")];
}
