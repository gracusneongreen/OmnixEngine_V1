# Omnix AI Game Generator V1

Omnix has a structured foundation for an AI-assisted game/mod generator.

## Modules

- Voice Studio
- Voice profiles and reference-audio input
- AI Cutscene planning
- Character expressions in dialogue
- TV event/news generation
- Game Style Generator
- Central game generation pipeline

## Voice

Voice generation is provider-based. The engine stores a request contract and result contract rather than embedding a specific commercial service.

Reference voice input is gated by explicit consent. The engine must not treat an uploaded recording as permission to imitate a person.

## Cutscenes

A cutscene contains:

- dialogue
- speaker
- expression
- voice profile
- duration
- camera plan
- animation plan
- sound plan
- game events

The AI layer should return structured scene data. Actual audio, images, animation and video are produced by the selected providers.

## TV events

TV broadcasts are structured game events. A generated broadcast can contain:

- breaking-news headline
- reporter
- report text
- optional image
- reporter voice profile
- glitch state
- a game-event trigger

This allows a cutscene to react to story events without requiring a pre-rendered video.

## Styles

Presets currently include:

- summer
- winter
- halloween
- christmas
- school
- corruption
- custom

A style is a direction layer, not a promise of reproducing another creator's exact copyrighted style.

## Full pipeline

User prompt -> style -> assets -> music -> chart -> voice -> cutscene -> TV events -> FX -> test -> export.

## Provider architecture

Providers remain replaceable. LM Studio/vLLM can handle the planning/chat layer, while specialized local or remote providers can handle audio, image, video and other generation tasks.

The engine must report missing providers or generated assets instead of pretending generation succeeded.
