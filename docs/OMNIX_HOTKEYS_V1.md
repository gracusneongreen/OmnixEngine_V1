# OmnixEngine V1 Hotkeys

## Function keys

| Key | Action |
|---|---|
| F1 | Main Menu |
| F2 | AI Chat |
| F3 | Computer Use |
| F4 | AI Draw |
| F5 | Reload current state |
| F6 | Chart Editor |
| F7 | Cutscene / TV Events |
| F8 | Shader / FX |
| F9 | Debug AI |
| F10 | Mod Project |
| F11 | Fullscreen |
| F12 | Screenshot |

The central dispatcher is `OmnixHotkeyManager`. Feature modules can subscribe to its action callback.

All F1-F12 actions are now handled by the dispatcher:

- F1, F3, F5, F6, F8, F10 and F11 open or control their corresponding engine state directly.
- F2 opens the AI Center in Chat mode.
- F4 opens the AI Center in Draw AI mode.
- F7 opens the AI Center in Mod mode for cutscene/TV project work.
- F9 opens the AI Center in Debug mode.
- F12 opens the Computer Use desktop, where the Screenshot action is available.

The F-keys are captured at the OpenFL application stage and work regardless of the active Flixel state.
