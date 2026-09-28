# Omnix Art Knowledge V1

Omnix now has an Art Bible layer that can carry visual knowledge into asset generation.

## What can be stored

- Style reference images
- Character reference images
- Background reference images
- Prop references
- Brush profiles
- Palette
- Line weight
- Shading method
- Lighting direction
- Perspective
- Scale rules
- Negative rules

## Why this exists

An AI generator should not receive every asset prompt as an isolated request. The project needs a persistent visual context. Reference images can act as anchors, while the Art Bible stores explicit rules such as palette, line weight, lighting and brush behavior.

This follows a common consistency workflow: choose a stable visual anchor, reuse it for later assets, and keep character generation tied to the approved character reference instead of regenerating the identity from scratch. citeturn0search0turn0search2

## Character workflow

1. Upload the canonical character image.
2. Store it as a character reference.
3. Add optional pose/expression references.
4. Generate new poses from the same character context.
5. Send the result through the existing rig/pose/spritesheet pipeline.

## Background workflow

1. Upload an approved background.
2. Store it as a background reference.
3. Record camera, perspective, palette, lighting and scale.
4. Generate new backgrounds using the same Art Bible context.

## Brush workflow

A brush profile records properties such as size, hardness, opacity, spacing, smoothing, texture and edge style. These are metadata for the drawing/generation pipeline; they do not claim that an external AI model literally learned a proprietary brush engine.

## Important limitation

Reference images and metadata improve consistency, but they do not guarantee pixel-perfect reproduction. The generation provider still needs to support image conditioning/reference input. Omnix therefore keeps this layer provider-neutral.
