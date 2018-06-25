from core.tasks import generate_phash


def generate_image_phash(image):
    if not image.phash:
        generate_phash.delay(image.id)
