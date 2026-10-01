# Base44 Dev Environment

## Project Overview
Haxe/HaxeFlixel game project (Psych Engine for Friday Night Funkin' with Omnix AI extensions). Compiled to HTML5 for web preview.

## Build & Run
- `docker compose -f docker-compose.base44.yml up -d` — builds the Docker image (installs Haxe 4.3.4 + haxelibs), then compiles the game to HTML5 and serves it on port 3000.
- First boot takes 5–10 minutes (Haxe compilation). Subsequent boots reuse cached `export/` output.
- The Docker image caches haxelib installations; source is bind-mounted so edits are picked up on restart.
- No live-reload dev server exists for Haxe — after code changes, restart the container (`docker compose -f docker-compose.base44.yml restart`) and call `reload_preview`.

## Key Modifications for Web
- `DISCORD_ALLOWED` restricted to `if="desktop"` (hxdiscord_rpc has no HTML5 backend).
- `MULTITHREADED_LOADING` restricted to `if="desktop"` (sys.thread FixedThreadPool has limited web support).
- Lua scripting, HScript, and video playback are already guarded by `if="desktop"` in Project.xml.

## No External Secrets Required
- Omnix AI features call a local LM Studio server (http://127.0.0.1:1234/v1, key "lm-studio") via `haxe.Http` — optional, does not affect compilation or basic gameplay.

## Verification
- `curl -f http://localhost:3000/` returns the game's HTML page after compilation completes.
- The game renders in a canvas element at 1280×720 with keyboard controls.
