# Omnix AI — Proactive Replies & Notifications

Omnix AI supports user-initiated messages and configurable proactive AI messages.

Proactive events:
- TASK_COMPLETE
- ERROR
- APPROVAL_REQUIRED
- AGENT_WAITING
- AI_MESSAGE

The notification layer must not grant the AI extra permissions. Computer-use actions remain governed by the existing computer-use policy and approval system.

Windows notification delivery should respect quiet hours and cooldown settings so the user is not flooded.

For new Windows App SDK applications, Microsoft recommends AppNotificationManager for WinUI/WPF/WinForms/unpackaged Win32 notification scenarios; legacy UWP uses ToastNotificationManager.
