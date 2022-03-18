#!/usr/bin/python3
import json
import logging

from pathlib import Path

from PIL import Image

from library import create_thumbnail

base_dir = Path(__file__).resolve().parent.parent / "content" / "gallery"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


if __name__ == "__main__":
    images = []
    for item in sorted(base_dir.glob("*.jpg")):
        if item.is_file():
            logger.info(f"Processing {item.name}")
            with Image.open(item) as img:
                create_thumbnail(
                    img, base_dir / f"{item.stem}.display.webp", 1920, 1280, crop=False
                )
                create_thumbnail(img, base_dir / f"{item.stem}.preview.webp", 394, 222, crop=True)
                create_thumbnail(img, base_dir / f"{item.stem}.thumbnail.webp", 80, 45, crop=True)
                images.append(
                    {
                        "id": int(item.stem.split("_")[0]),
                        "original": f"/gallery/{item.name}",
                        "display": f"/gallery/{item.stem}.display.webp",
                        "preview": f"/gallery/{item.stem}.preview.webp",
                        "thumbnail": f"/gallery/{item.stem}.thumbnail.webp",
                    }
                )
    with open(base_dir.parent / "gallery.json", "w") as f:
        f.write(json.dumps({"images": images}))
