import base64
import os
import random

import pytest

from pathlib import Path
from xprocess import ProcessStarter

BASE_DIR = Path(__file__).resolve().parent.parent.parent


@pytest.fixture(scope="package")
def client(xprocess):
    class Starter(ProcessStarter):
        pattern = "Rocket has launched from"
        env = {
            "ROCKET_PORT": str(random.randint(9000, 9999)),
            "ROCKET_TEMPLATE_DIR": BASE_DIR / "templates",
            "ROCKET_SECRET_KEY": base64.b64encode(os.urandom(16).hex().encode()),
        }
        args = [BASE_DIR / "dist/app"]
        host = f"http://0.0.0.0:{env['ROCKET_PORT']}"

    xprocess.ensure("client", Starter)
    yield Starter
    xprocess.getinfo("client").terminate()
