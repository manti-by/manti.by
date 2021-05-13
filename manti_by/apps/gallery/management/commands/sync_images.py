import os

from PIL import Image as PILImage
from imagehash import phash

from django.conf import settings
from django.core.management.base import BaseCommand

from manti_by.apps.gallery.models import Gallery, Image


class Command(BaseCommand):
    help = "Sync gallery images"

    def handle(self, *args, **options):
        checked = added = 0
        images = Image.objects.values_list("phash", flat=True)
        galleries = Gallery.objects.values_list("slug", flat=True)
        gallery_path = os.path.join(settings.MEDIA_ROOT, "gallery")
        for root, dirs, f in os.walk(gallery_path):
            for dir in dirs:
                if dir not in galleries:
                    gallery = Gallery(name=dir)
                    gallery.save()
                else:
                    gallery = Gallery.objects.get(slug=dir)
                for dir_root, d, files in os.walk(os.path.join(root, dir)):
                    for file in files:
                        file_name = os.path.join(dir_root, file)
                        file_image = PILImage.open(file_name)
                        file_phash = str(phash(file_image))
                        checked += 1
                        if file_phash not in images:
                            image = Image(phash=file_phash, gallery=gallery)
                            image.original_image.name = file_name.replace(
                                settings.MEDIA_ROOT, ""
                            )[1:]
                            image.save()
                            self.stdout.write("Saved %s" % image.original_image.name)
                            added += 1
        self.stdout.write("Checked %d images, added %d" % (checked, added))
