package omnix.ai.computer;

class OmnixComputerActionValidator {
    public static function validate(action:OmnixComputerAction):String {
        if (action == null) return "NULL_ACTION";
        switch (action.type) {
            case "click", "double_click", "move":
                if (action.x < 0 || action.y < 0) return "INVALID_COORDINATES";
            case "type":
                if (action.text == null) return "INVALID_TEXT";
            case "key":
                if (action.key == null || action.key == "") return "INVALID_KEY";
            case "scroll", "wait", "screenshot":
            case "open_app", "install_app", "run_command":
                return "SENSITIVE_ACTION_REQUIRES_HOST_POLICY";
            default:
                return "UNSUPPORTED_ACTION";
        }
        return "OK";
    }
}
