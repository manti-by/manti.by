#!/usr/bin/python3
import json
import logging

from pathlib import Path

from PIL import Image

base_dir = Path(__file__).resolve().parent.parent / "content" / "gallery"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


if __name__ == "__main__":
    for index, item in enumerate(sorted(base_dir.glob("*.jpg"))):
        clean_name = item.name.split("_")[-1]
        item.rename(base_dir / f"{index:02d}_{clean_name}")
