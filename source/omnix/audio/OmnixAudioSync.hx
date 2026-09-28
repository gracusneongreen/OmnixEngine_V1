package omnix.audio;

class OmnixAudioSync {
    public var positionMs:Float = 0;
    public var offsetMs:Float = 0;
    public function new() {}
    public function update(rawPositionMs:Float):Void positionMs = rawPositionMs + offsetMs;
    public function setOffset(value:Float):Void offsetMs = value;
}
