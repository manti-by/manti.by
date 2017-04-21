from __future__ import unicode_literals

import os

from django.conf import settings
from django.core.management.base import BaseCommand

from gallery.models import Gallery, Image


class Command(BaseCommand):
    help = 'Import bearings from CSV file'

    def handle(self, *args, **options):
        checked = added = 0
        gallery_path = os.path.join(settings.MEDIA_ROOT, 'gallery')
        for root, dirs, files in os.walk(gallery_path):
            for dir in dirs:
                pass
        self.stdout.write('Checked %d images, added %d' % (checked, added))