#!/usr/bin/python3
import json
import logging

from concurrent import futures
from pathlib import Path

from library import create_previews_and_releases

base_dir = Path(__file__).resolve().parent.parent / "content"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


if __name__ == "__main__":
    result = []
    workers = 4

    release_dir = base_dir / "release"
    files = sorted(release_dir.glob("*.[mf][pl][3a]*"))
    chunk_size = len(files) // workers + 1
    file_chunks = [files[i: i + chunk_size] for i in range(len(files))[::chunk_size]]

    processes = []
    with futures.ProcessPoolExecutor(max_workers=workers) as executor:
        for i in range(workers):
            processes.append(
                executor.submit(create_previews_and_releases, file_chunks[i], base_dir, result)
            )
    for f in futures.as_completed(processes):
        logger.info(f"Thread {f} is completed")

    with open(release_dir.parent / "release.json", "w") as f:
        f.write(json.dumps(result))
