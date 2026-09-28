# OmnixDraw Model V1

Training and inference scaffold for a user-owned art model used by OmnixEngine.

The first implementation uses a pretrained diffusion base model plus LoRA instead of training billions of parameters from scratch. LoRA keeps the base model frozen and trains a much smaller adapter.

## Dataset

Put only assets you are allowed to train on under:

~~~text
dataset/
  characters/
  backgrounds/
  props/
  poses/
  expressions/
  lineart/
~~~

Each image can have a matching .txt caption. The dataset builder creates a JSONL manifest.

Recommended first dataset: 50-200 clean character images, 30-100 backgrounds, 20-80 props, plus multiple poses and expressions.

## Training

1. Build the manifest:

~~~bash
python tools/omnix-draw-model/build_dataset.py --input dataset --output models/omnixdraw/dataset.jsonl
~~~

2. Install dependencies:

~~~bash
pip install -r tools/omnix-draw-model/requirements.txt
~~~

3. Configure train_config.json.
4. Run train_lora.py.

The training script is intentionally a scaffold: the exact training entry point depends on the selected diffusion model and GPU environment.

## Omnix integration

The resulting adapters are intended to connect to the Omnix Art Bible and Draw Pipeline:

~~~text
OmnixDraw-Base
  + OmnixStyle LoRA
  + OmnixCharacter LoRA
  + OmnixBackground LoRA
~~~

Do not train on third-party assets unless their license explicitly permits training. Do not use this system to reproduce another creator's protected character or exact artwork without permission.
