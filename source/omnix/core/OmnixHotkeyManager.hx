package omnix.core;

import flixel.FlxG;
import backend.MusicBeatState;
import states.MainMenuState;
import states.editors.ChartingState;
import states.editors.CharacterEditorState;
import states.editors.MasterEditorMenu;
import objects.Character;
import omnix.ui.OmnixAgentDesktopState;

/**
 * Central OmnixEngine V1 function-key map.
 *
 * The manager detects shortcuts and dispatches feature actions. Feature
 * modules can subscribe through onAction without coupling the core state
 * to individual editors.
 */
class OmnixHotkeyManager {
    public static inline var F1:String = "main_menu";
    public static inline var F2:String = "ai_chat";
    public static inline var F3:String = "computer_use";
    public static inline var F4:String = "ai_draw";
    public static inline var F5:String = "reload";
    public static inline var F6:String = "chart_editor";
    public static inline var F7:String = "cutscene_tv";
    public static inline var F8:String = "shader_fx";
    public static inline var F9:String = "debug_ai";
    public static inline var F10:String = "mod_project";
    public static inline var F11:String = "fullscreen";
    public static inline var F12:String = "screenshot";

    public static var onAction:String->Void;

    public static function update():Void {
        if (FlxG.keys.justPressed.F1) dispatch(F1);
        if (FlxG.keys.justPressed.F2) dispatch(F2);
        if (FlxG.keys.justPressed.F3) dispatch(F3);
        if (FlxG.keys.justPressed.F4) dispatch(F4);
        if (FlxG.keys.justPressed.F5) dispatch(F5);
        if (FlxG.keys.justPressed.F6) dispatch(F6);
        if (FlxG.keys.justPressed.F7) dispatch(F7);
        if (FlxG.keys.justPressed.F8) dispatch(F8);
        if (FlxG.keys.justPressed.F9) dispatch(F9);
        if (FlxG.keys.justPressed.F10) dispatch(F10);
        if (FlxG.keys.justPressed.F11) dispatch(F11);
        if (FlxG.keys.justPressed.F12) dispatch(F12);
    }

    public static function dispatch(action:String):Void {
        handleBuiltIn(action);
        if (onAction != null) onAction(action);
    }

    private static function handleBuiltIn(action:String):Void {
        switch (action) {
            case F1:
                MusicBeatState.switchState(new MainMenuState());
            case F3:
                MusicBeatState.switchState(new OmnixAgentDesktopState());
            case F4:
                MusicBeatState.switchState(new CharacterEditorState(Character.DEFAULT_CHARACTER, false));
            case F5:
                MusicBeatState.resetState();
            case F6:
                MusicBeatState.switchState(new ChartingState());
            case F10:
                MusicBeatState.switchState(new MasterEditorMenu());
            case F11:
                FlxG.fullscreen = !FlxG.fullscreen;
            default:
        }
    }

    public static function label(action:String):String {
        return switch (action) {
            case F1: "Main Menu";
            case F2: "AI Chat";
            case F3: "Computer Use";
            case F4: "AI Draw";
            case F5: "Reload";
            case F6: "Chart Editor";
            case F7: "Cutscene / TV Events";
            case F8: "Shader / FX";
            case F9: "Debug AI";
            case F10: "Mod Project";
            case F11: "Fullscreen";
            case F12: "Screenshot";
            default: action;
        };
    }
}
