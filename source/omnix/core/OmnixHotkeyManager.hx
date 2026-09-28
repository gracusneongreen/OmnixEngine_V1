package omnix.core;

import flixel.FlxG;
import backend.MusicBeatState;
import states.MainMenuState;
import states.editors.ChartingState;
import states.editors.CharacterEditorState;
import states.editors.MasterEditorMenu;
import objects.Character;
import omnix.ui.OmnixAgentDesktopState;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * Global OmnixEngine V1 function-key manager.
 *
 * Keyboard events are captured at the application stage, so F1-F12 work
 * regardless of which Flixel state is currently active.
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
    private static var initialized:Bool = false;

    /**
     * Install the global keyboard listener once.
     * Safe to call repeatedly.
     */
    public static function initialize():Void {
        if (initialized) return;
        if (Lib.current == null || Lib.current.stage == null) return;

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        initialized = true;
    }

    /**
     * Legacy per-frame entry point kept for compatibility with existing
     * integrations. Global keyboard handling is now performed by onKeyDown.
     */
    public static function update():Void {
        initialize();
    }

    private static function onKeyDown(event:KeyboardEvent):Void {
        var action:String = actionFromKeyCode(event.keyCode);
        if (action == null) return;

        // Prevent the browser/platform from consuming F-keys first.
        event.preventDefault();
        dispatch(action);
    }

    private static function actionFromKeyCode(keyCode:Int):String {
        return switch (keyCode) {
            case Keyboard.F1: F1;
            case Keyboard.F2: F2;
            case Keyboard.F3: F3;
            case Keyboard.F4: F4;
            case Keyboard.F5: F5;
            case Keyboard.F6: F6;
            case Keyboard.F7: F7;
            case Keyboard.F8: F8;
            case Keyboard.F9: F9;
            case Keyboard.F10: F10;
            case Keyboard.F11: F11;
            case Keyboard.F12: F12;
            default: null;
        };
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
