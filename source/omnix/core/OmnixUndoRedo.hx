package omnix.core;

class OmnixUndoRedo {
    private var undoStack:Array<Void->Void>;
    private var redoStack:Array<Void->Void>;

    public function new() {
        undoStack = [];
        redoStack = [];
    }

    public function push(undo:Void->Void, redo:Void->Void):Void {
        undoStack.push(undo);
        redoStack = [];
    }

    public function undo():Bool {
        if (undoStack.length == 0) return false;
        var action = undoStack.pop();
        action();
        return true;
    }

    public function clear():Void {
        undoStack = [];
        redoStack = [];
    }

    public function undoCount():Int return undoStack.length;
    public function redoCount():Int return redoStack.length;
}
