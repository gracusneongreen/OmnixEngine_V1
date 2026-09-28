# OMNIX-ID DRAW INTEGRATION

Omnix Draw objects now carry stable engine identifiers.

## ID hierarchy

- Project: `OMNIX-PROJECT-XXXXXXXX`
- Rig: `OMNIX-RIG-XXXXXXXX`
- Part: `OMNIX-PART-XXXXXXXX`
- Layer: `OMNIX-LAYER-XXXXXXXX`

Human-readable IDs such as `hand_r` remain supported.

## AI addressing

Draw AI may address a target using either the readable part ID or an OMNIX-ID:

```json
{
  "tool": "draw",
  "action": "move",
  "target": "OMNIX-PART-A1B2C3D4",
  "arguments": {
    "x": 42,
    "y": -18
  }
}
```

This allows AI actions to remain unambiguous even when multiple projects or rigs contain similarly named parts.

## Next layer

The ID system is ready to be extended to animation clips, poses, keyframes, assets and exported files.
