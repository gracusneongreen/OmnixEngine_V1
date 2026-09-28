# Omnix Agent Desktop

Visual control surface for the Omnix Computer Use Agent.

Features:
- desktop screenshot retrieval
- connection status
- AI transcript
- command input
- app launching
- app installation through the computer-use host
- approved mouse and keyboard actions

Architecture:

Omnix AI Chat
  -> Omnix Agent Desktop
  -> OmnixComputerAgent
  -> computer-use host :8765
  -> desktop, apps, files and browser

The UI does not grant operating-system privileges itself. The external computer-use host controls permissions, sandboxing, allowlists, downloads and installation.

Workflow:
1. Start the approved computer-use host.
2. Start OmnixEngine.
3. Open Omnix Agent Desktop.
4. Press CONNECT.
5. Press SCREEN.
6. Send an AI task.
7. The host validates and executes approved actions.
