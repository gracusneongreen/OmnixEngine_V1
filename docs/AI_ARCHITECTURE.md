# OmnixFNF-AI + Omnix AI Chat

OmnixEngine uses a two-layer AI architecture.

## OmnixFNF-AI

OmnixFNF-AI is the FNF-specialized model profile. The model weights are served externally so the game repository stays lightweight.

Recommended local deployment:
- LM Studio: OpenAI-compatible API at http://127.0.0.1:1234/v1
- vLLM: OpenAI-compatible API at http://127.0.0.1:8000/v1

The model is guided by an FNF-specific system prompt and can later be extended with a local FNF knowledge base/RAG.

## Omnix AI Chat

The engine can send a question to the configured provider and parse an OpenAI-compatible chat-completions response.

Example questions:
- "Dlaczego mój chart się nie ładuje?"
- "Zrób modchart RGB zsynchronizowany z beatem."
- "Jak zrobić animację singLEFT dla Gracjana?"
- "Wygeneruj strukturę stage + events."

## Important

The Haxe layer is the client/bridge, not the model weights themselves. A GGUF or other model file should be stored outside GitHub and loaded by LM Studio/vLLM. This makes the engine portable and avoids committing multi-GB model files.
