import argparse
import json
from pathlib import Path

IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp"}


def read_caption(image_path: Path) -> str:
    caption_path = image_path.with_suffix(".txt")
    if caption_path.exists():
        return caption_path.read_text(encoding="utf-8").strip()

    parts = [p for p in image_path.parts if p.name != "dataset"]
    category = parts[0] if parts else "art"
    return f"omnix original art, {category}"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    root = Path(args.input)
    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)

    count = 0
    with output.open("w", encoding="utf-8") as handle:
        for image_path in sorted(root.rglob("*")):
            if image_path.suffix.lower() not in IMAGE_EXTENSIONS:
                continue

            relative = image_path.relative_to(root)
            category = relative.parts[0] if relative.parts else "art"
            record = {
                "image": str(image_path.as_posix()),
                "category": category,
                "caption": read_caption(image_path),
            }
            handle.write(json.dumps(record, ensure_ascii=False) + "\n")
            count += 1

    print(f"OmnixDraw dataset manifest: {count} images -> {output}")


if __name__ == "__main__":
    main()
