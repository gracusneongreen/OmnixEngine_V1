package omnix.ai.style;

class OmnixGameStyleGenerator {
    public function new() {}

    public function createPreset(id:String):OmnixGameStyle {
        var style = new OmnixGameStyle(id, id);
        switch (id) {
            case "summer":
                style.tags = ["summer", "vacation", "beach"];
                style.world = "Bright vacation locations, beach and outdoor scenes.";
                style.musicDirection = "Energetic summer rhythm.";
            case "winter":
                style.tags = ["winter", "snow", "holiday"];
                style.world = "Snowy streets and cold indoor locations.";
                style.musicDirection = "Cold atmospheric electronic.";
            case "halloween":
                style.tags = ["halloween", "horror", "night"];
                style.world = "Dark seasonal locations with spooky lighting.";
                style.musicDirection = "Dark horror electronic.";
            case "christmas":
                style.tags = ["christmas", "holiday", "winter"];
                style.world = "Festive winter environments.";
                style.musicDirection = "Festive music with game-style rhythm.";
            case "school":
                style.tags = ["school", "day", "urban"];
                style.world = "School corridors, classrooms and playgrounds.";
                style.musicDirection = "Energetic school-day rhythm.";
            case "corruption":
                style.tags = ["corruption", "glitch", "horror"];
                style.world = "Distorted environments with corruption effects.";
                style.musicDirection = "Dark glitch-heavy rhythm.";
            default:
                style.tags = ["custom"];
        }
        return style;
    }
}
