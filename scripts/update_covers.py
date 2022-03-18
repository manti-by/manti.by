#!/usr/bin/python3
import json
import logging

from pathlib import Path

from PIL import Image

from library import create_thumbnail

base_dir = Path(__file__).resolve().parent.parent / "content" / "covers"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


if __name__ == "__main__":
    for index, item in enumerate(sorted(base_dir.glob("*.jpg"))):
        if item.is_file():
            logger.info(f"Processing {item.name}")
            with Image.open(item) as img:
                create_thumbnail(
                    img, base_dir / f"{item.stem}.display.webp", 600, 600, crop=False
                )
                create_thumbnail(img, base_dir / f"{item.stem}.preview.webp", 400, 400, crop=True)
                create_thumbnail(img, base_dir / f"{item.stem}.thumbnail.webp", 50, 50, crop=True)
