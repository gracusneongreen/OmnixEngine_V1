package omnix.ai.draw;

class OmnixDrawValidation {
    public static function validateAction(raw:String):String {
        if (raw == null || StringTools.trim(raw) == "") return "EMPTY";
        if (raw.length > 4096) return "TOO_LARGE";
        return "OK";
    }

    public static function validatePart(editor:OmnixDrawEditorState, partId:String):Bool {
        return editor != null && editor.rig.get(partId) != null;
    }

    public static function validateScale(amount:Float):Bool {
        return amount > 0.05 && amount < 20;
    }
}
