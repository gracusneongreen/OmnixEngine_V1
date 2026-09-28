from pathlib import Path
from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="OmnixDraw Local Image Backend")


class GenerateRequest(BaseModel):
    prompt: str
    negative_prompt: Optional[str] = ""
    width: int = 512
    height: int = 512
    steps: int = 20
    guidance_scale: float = 7.0
    seed: int = -1
    output_path: Optional[str] = None
    adapters: dict = {}


@app.get("/health")
def health():
    return {"ok": True, "service": "omnixdraw"}


@app.post("/api/generate")
def generate(request: GenerateRequest):
    # This is the stable OmnixDraw API contract.
    # Connect a selected Diffusers pipeline here after choosing a licensed
    # base model. Keeping the HTTP contract stable lets the engine remain
    # independent from the model implementation.
    return {
        "ok": False,
        "message": "No image model is configured. Set a licensed base model and connect its Diffusers pipeline.",
        "image_path": None,
        "image_base64": None,
    }
