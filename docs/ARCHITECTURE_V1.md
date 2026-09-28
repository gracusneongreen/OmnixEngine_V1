# OmnixEngine V1 Architecture

Core -> runtime services -> modding -> tools/AI.

AI flow:
AI Agent -> validated Omnix command -> ModAPI -> assets/chart/stage/events -> playable mod.

Safety:
- invalid shader: disable/fallback
- invalid animation: keep previous state
- invalid BPM: safe default
- invalid command: reject before execution
- AI is optional and never required to launch the engine
