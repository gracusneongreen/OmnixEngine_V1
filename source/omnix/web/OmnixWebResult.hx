package omnix.web;

class OmnixWebResult {
    public var success:Bool;
    public var status:Int;
    public var title:String;
    public var url:String;
    public var content:String;
    public var error:String;

    public function new(?success:Bool = false) {
        this.success = success;
        status = 0;
        title = "";
        url = "";
        content = "";
        error = "";
    }
}