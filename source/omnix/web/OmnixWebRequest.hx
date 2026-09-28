package omnix.web;

import omnix.core.OmnixID;

class OmnixWebRequest {
    public var omnixId:String;
    public var action:String;
    public var url:String;
    public var query:String;

    public function new(action:String, ?url:String = "", ?query:String = "") {
        omnixId = OmnixID.random("WEB_REQUEST");
        this.action = action;
        this.url = url;
        this.query = query;
    }
}