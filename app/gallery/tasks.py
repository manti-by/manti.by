from __future__ import unicode_literals

from celery.task import task


@task
def generate_thumbnails(image_id):
    from gallery.models import Image
    image = Image.objects.get(pk=image_id)
    image.generate_thumbnails()


@task
def generate_phash(image_id):
    from gallery.models import Image
    image = Image.objects.get(pk=image_id)
    image.generate_phash()
