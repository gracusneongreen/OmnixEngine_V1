"""
OmnixDraw LoRA training entry point.

This file validates the training configuration and prepares the run.
The actual model-specific Diffusers training loop should be selected after
the project chooses a licensed base model and verifies its architecture.
"""

import argparse
import json
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", required=True)
    args = parser.parse_args()

    config_path = Path(args.config)
    config = json.loads(config_path.read_text(encoding="utf-8"))

    required = [
        "base_model",
        "output_dir",
        "dataset_manifest",
        "resolution",
        "train_batch_size",
        "learning_rate",
        "max_train_steps",
        "lora_rank",
        "lora_alpha",
    ]
    missing = [key for key in required if key not in config]
    if missing:
        raise SystemExit("Missing training settings: " + ", ".join(missing))

    if config["base_model"].startswith("SET_"):
        raise SystemExit(
            "Choose a licensed diffusion base model in train_config.json before training."
        )

    manifest = Path(config["dataset_manifest"])
    if not manifest.exists():
        raise SystemExit(f"Dataset manifest not found: {manifest}")

    output = Path(config["output_dir"])
    output.mkdir(parents=True, exist_ok=True)

    print("OmnixDraw Model V1 training configuration is valid.")
    print(f"Base model: {config['base_model']}")
    print(f"Dataset: {manifest}")
    print(f"Output: {output}")
    print(f"LoRA rank: {config['lora_rank']}")
    print()
    print("Next step: connect this entry point to the selected Diffusers")
    print("LoRA training script after the base model architecture is confirmed.")


if __name__ == "__main__":
    main()
