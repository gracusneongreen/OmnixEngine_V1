# OmnixEngine V1 — Language System

OmnixEngine supports a multi-language architecture without forcing every language into the native engine build.

## Languages

| Language | Extension | Role |
|---|---|---|
| Haxe | .hx | Native engine/runtime |
| Python | .py | AI tools, generators and automation |
| JavaScript | .js | Web tools, UI and integrations |
| OmnixScript | .omx | FNF gameplay/mod scripting |
| OmnixAI | .oai | Declarative AI tasks and tool plans |
| OmnixFlow | .oflow | Asset/animation/chart/build pipelines |

## New Omnix languages

### OmnixScript (.omx)

Designed for concise FNF logic:

    song "DeepDark" {
        bpm 95
        onBeat 16 => camera.zoom += 0.05
        onPhase "corruption" => shader "rgb_pulse"
    }

The first V1 implementation should use a small parser/interpreter or compile to a safe internal command graph. Do not execute arbitrary host commands from .omx.

### OmnixAI (.oai)

A declarative format for AI tasks:

    agent "FNFBuilder" {
        goal "Create a corruption week"
        use draw
        use chart
        use shader
        test build
    }

The runtime should convert this into validated OmnixAgentTask/tool calls.

### OmnixFlow (.oflow)

A pipeline language:

    input character.png
    -> rig human
    -> poses idle,left,right,up,down
    -> spritesheet
    -> xml
    -> export mod

The first V1 implementation should compile this into a deterministic pipeline graph.

## Safety model

Python and JavaScript are external runtimes and should be sandboxed when used by the agent. OmnixScript, OmnixAI and OmnixFlow should never implicitly gain unrestricted filesystem, shell or network access.

This registry is intentionally metadata-only in this commit so the existing Psych Engine build is not destabilized before compilation.
