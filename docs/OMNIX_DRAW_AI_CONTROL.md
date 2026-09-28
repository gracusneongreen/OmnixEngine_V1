# Omnix Draw AI Control Protocol

Omnix Draw AI can control the editable character rig through JSON actions.

Example:

{
  "tool": "draw",
  "action": "move",
  "arguments": {
    "partId": "hand_r",
    "x": 42,
    "y": -18
  }
}

Supported actions:

- select(partId)
- move(partId, x, y)
- rotate(partId, degrees)
- scale(partId, amount)
- pose(name)
- asset(partId, path, width, height)
- visible(partId, value)
- save()

Recommended AI loop:

AI instruction
-> screenshot/viewport observation
-> JSON draw action
-> local validation
-> OmnixDrawAIController
-> rig/layer update
-> viewport refresh
-> screenshot
-> next action

The controller only manipulates the Omnix Draw project state. It does not grant OS permissions or execute shell commands.
