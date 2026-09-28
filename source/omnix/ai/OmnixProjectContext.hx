package omnix.ai;

import omnix.core.OmnixID;

class OmnixProjectContext {
    public var omnixId:String;
    public var projectName:String;
    public var files:Array<String>;
    public var notes:Array<String>;

    public function new(?projectName:String = "Untitled Omnix Project") {
        omnixId = OmnixID.make("CONTEXT", projectName);
        this.projectName = projectName;
        files = [];
        notes = [];
    }

    public function addFile(path:String):Void files.push(path);
    public function addNote(note:String):Void notes.push(note);
}
