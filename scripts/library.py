import subprocess

from pathlib import Path
from typing import List

from PIL import Image


def create_thumbnail(
    original_image: Image, file_path: Path, width: int, height: int, crop: bool
):
    target_image = original_image.copy()
    if not Path(file_path).is_file():
        # Resize original image to target width
        target_height = int(original_image.height * width / original_image.width)
        target_image = target_image.resize((width, target_height), Image.ANTIALIAS)

        # Crop image to target height if offset more than 2 pixels
        offset = int((target_height - height) / 2)
        if crop and offset > 2:
            target_image = target_image.crop((0, offset, width, height + offset))

        # Save to target file name
        target_image.save(file_path, "WEBP")


def create_preview(original_file: Path, target_file: Path, codec: str = "libmp3lame"):
    if not Path(target_file).is_file():
        command = (
            f"ffmpeg -y -i {original_file} -acodec {codec} "
            f"-t 1800 -ac 1 -ab 96k -ar 44100 -af afade=t=out:st=1770:d=30 {target_file}"
        )
        subprocess.call(command.split(" "))


def create_release(original_file: Path, target_file: Path, codec: str = "libmp3lame"):
    if not Path(target_file).is_file():
        command = f"ffmpeg -y -i {original_file} -acodec {codec} -ab 320k {target_file}"
        subprocess.call(command.split(" "))


def create_previews_and_releases(items: List[Path], base_dir: Path, result: List[dict]):
    for item in items:
        create_release(item, base_dir / "release" / f"{item.stem}.mp3")
        create_release(item, base_dir / "release" / f"{item.stem}.ogg", "libvorbis")
        create_preview(item, base_dir / "preview" / f"{item.stem}.mp3")
        create_preview(item, base_dir / "preview" / f"{item.stem}.ogg", "libvorbis")
        result.append(
            {
                "original": f"/release/{item.name}",
                "release": {
                    "mp3": f"/release/{item.stem}.mp3",
                    "ogg": f"/release/{item.stem}.ogg",
                },
                "preview": {
                    "mp3": f"/preview/{item.stem}.mp3",
                    "ogg": f"/preview/{item.stem}.ogg",
                }
            }
        )
