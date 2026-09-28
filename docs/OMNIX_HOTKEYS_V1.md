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

F5 and F11 have core behavior immediately: F5 reloads the current state and F11 toggles fullscreen. F2 opens the existing AI chat controller.

The remaining feature actions are registered in the central dispatcher and are ready for their respective UI modules to bind.
