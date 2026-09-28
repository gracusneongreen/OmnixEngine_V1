# Omnix Computer Use Agent

Omnix AI can be paired with a real agent desktop instead of being limited to text chat.

## Architecture

```
Omnix AI Chat
    |
    +-- OmnixFNF-AI
    |
    +-- OmnixFNF-Draw
    |
    +-- Computer Use Agent
             |
             +-- live screenshots
             +-- mouse
             +-- keyboard
             +-- desktop/apps
             +-- app launcher
             +-- app installer
             +-- approved shell commands
```

The engine talks to a small computer-use host through an HTTP API. The host owns the actual OS permissions.

## Endpoint

Default: `http://127.0.0.1:8765`

Required endpoints:

- `GET /health`
- `POST /computer/screenshot`
- `POST /computer/action`

Actions include screenshot, click, double click, type, key, scroll, move, wait, open_app, install_app and run_command.

## Safety

The default configuration uses `require_approval=true` and `sandbox=true`.

The Omnix engine does **not** silently install arbitrary software or execute arbitrary commands. The computer-use host should enforce an allowlist, show the user the requested action, and require approval for app installation, shell commands, and other sensitive operations.

## Example agent loop

```text
User: Open Krita and prepare a character canvas.

AI -> screenshot
AI -> inspect desktop
AI -> open_app("Krita")
AI -> screenshot
AI -> click(...)
AI -> type(...)
```

For downloads/installations, the host should use trusted sources and return the installed application's name/version to the agent.

## Future

This layer is intentionally provider-neutral so it can later connect to a dedicated real-computer agent, a containerized desktop, or another approved computer-use backend without changing OmnixEngine's AI modes.
