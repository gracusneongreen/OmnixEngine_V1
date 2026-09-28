# OmnixFNF-AI model

Do not commit large model weights to this repository.

Use an OpenAI-compatible local server and configure OmnixEngine to point to it.

## LM Studio
1. Load an instruct/coding model.
2. Start the local server.
3. Use: http://127.0.0.1:1234/v1

## vLLM
1. Start the model server.
2. Use: http://127.0.0.1:8000/v1

The model becomes OmnixFNF-AI through the FNF system prompt, project context, and later RAG/fine-tuning layers.
