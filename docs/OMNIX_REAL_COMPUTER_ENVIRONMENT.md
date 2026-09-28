# OMNIX Real Computer Environment

OmnixEngine can run its Computer Use agent against a real interactive desktop environment.

## Architecture

```
OMNIX AI CORE
      |
COMPUTER AGENT
      |
REAL COMPUTER ENVIRONMENT
      |
+---------------------------+
| Desktop / Sandbox         |
| - live screen             |
| - mouse                   |
| - keyboard                |
| - applications            |
| - workspace files         |
| - optional terminal      |
+---------------------------+
      |
OMNIX COMPUTER HOST :8765
```

The engine does not directly receive OS privileges. The host process owns the operating-system bridge.

## Recommended environment

Use a dedicated desktop/VM/container session for the agent. Give it:
- a visible desktop session;
- a dedicated Omnix workspace;
- only the applications required for the task;
- restricted network access;
- explicit approval for shell, installation, deletion and external navigation.

## Real interaction loop

1. Capture the live desktop.
2. Send the screenshot to the vision model.
3. Produce one structured computer action.
4. Validate the action against policy.
5. Ask for approval when required.
6. Execute it through the host.
7. Capture the new screen.
8. Continue until the task is complete.
9. Return a task log and result.

## Important distinction

"Real computer use" means the agent can interact with an actual desktop session. It does not mean the AI receives unrestricted access to the user's whole computer.

The safest default is a dedicated sandbox/VM with a shared workspace. The existing `tools/omnix-computer-host` remains the OS bridge.
