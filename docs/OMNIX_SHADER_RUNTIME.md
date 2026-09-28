# OMNIX SHADER RUNTIME

Runtime pipeline:

AI request
-> Shader Chat AI
-> procedural source
-> texture restriction validation
-> OmnixProceduralShader
-> OmnixShaderRuntime
-> uniforms
-> live preview integration

Uniform foundation:
- time
- bpm
- beat
- step
- intensity
- resolutionX
- resolutionY

The runtime deliberately does not create or require image textures.

Important: this is the runtime/control foundation. The actual engine-specific Flixel shader binding must be connected to the exact Psych Engine/OpenFL shader API after a local compile check. The preview state currently provides a safe black preview surface and advances runtime uniforms.
