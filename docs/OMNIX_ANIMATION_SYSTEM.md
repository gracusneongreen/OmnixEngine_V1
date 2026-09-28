# OMNIX ANIMATION SYSTEM

Omnix Draw now has an ID-addressable animation foundation.

## Objects

- Timeline: `OMNIX-TIMELINE-XXXXXXXX`
- Animation clip: `OMNIX-ANIM-XXXXXXXX`
- Keyframe: `OMNIX-KEYFRAME-XXXXXXXX`
- Pose: `OMNIX-POSE-XXXXXXXX`

## Flow

```
DRAW RIG
  -> POSE
  -> KEYFRAMES
  -> ANIMATION CLIP
  -> TIMELINE
  -> ANIMATION PLAYER
  -> SPRITESHEET EXPORT
```

## AI example

```json
{
  "tool": "draw_animation",
  "action": "add_keyframe",
  "target": "OMNIX-ANIM-1234ABCD",
  "arguments": {
    "time": 0.25,
    "rotation": -12
  }
}
```

The current implementation is a foundation. It does not yet claim automatic interpolation, spritesheet rendering or XML export.
