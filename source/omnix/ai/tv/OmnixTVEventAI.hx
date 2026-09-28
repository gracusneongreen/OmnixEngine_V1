package omnix.ai.tv;

class OmnixTVEventAI {
    public function new() {}

    public function createBreakingNews(id:String, headline:String, report:String):OmnixTVEvent {
        var event = new OmnixTVEvent(id, headline, report);
        event.glitch = true;
        return event;
    }
}
