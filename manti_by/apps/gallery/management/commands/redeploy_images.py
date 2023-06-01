import os
from datetime import datetime

import exifread
from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils.timezone import now

from manti_by.apps.gallery.models import Image


class Command(BaseCommand):
    help = "Redeploy images"

    def handle(self, *args, **options):
        Image.objects.all().delete()

        added = 0
        gallery_path = os.path.join(settings.MEDIA_ROOT, "gallery")
        for root, dirs, f in os.walk(gallery_path):
            for dir_root, d, files in os.walk(root):
                for file in files:
                    file_name = os.path.join(dir_root, file)
                    file_exif = open(file_name, "rb")
                    tags = exifread.process_file(file_exif)
                    created = (
                        datetime.strptime(str(tags["EXIF DateTimeOriginal"]), "%Y:%m:%d %H:%M:%S")
                        if "EXIF DateTimeOriginal" in tags
                        else now()
                    )

                    image = Image(created=created)
                    image.original_image.name = file_name.replace(settings.MEDIA_ROOT, "")
                    image.save()

                    self.stdout.write(f"Saved {image.original_image.name}")
                    added += 1

        self.stdout.write(f"Added {added} images")
