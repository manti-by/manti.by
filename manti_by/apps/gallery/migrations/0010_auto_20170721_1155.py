# Generated by Django 1.10.7 on 2017-07-21 11:55

from django.db import migrations


def update_translations(apps, schema_editor):
    Gallery = apps.get_model("gallery", "Gallery")
    for gallery in Gallery.objects.all():
        gallery.name_by = gallery.name_ru
        gallery.save()


class Migration(migrations.Migration):
    dependencies = [("gallery", "0009_gallery_name_by")]

    operations = [migrations.RunPython(update_translations)]
