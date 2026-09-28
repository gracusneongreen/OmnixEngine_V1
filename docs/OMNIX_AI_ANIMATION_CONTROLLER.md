# OMNIX AI ANIMATION CONTROLLER

The animation layer accepts structured AI tool calls.

Example tool: draw_animation.

Supported actions:
- create_clip
- add_keyframe
- play
- pause
- stop
- seek
- speed

Keyframes can be addressed through an animation OMNIX-ID. Linear interpolation is available through OmnixAnimationInterpolation.sample().

This is an engine foundation. Spritesheet rendering and XML/atlas writing are separate next stages.
