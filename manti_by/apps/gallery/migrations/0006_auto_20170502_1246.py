# Generated by Django 1.10.7 on 2017-05-02 12:46

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [("gallery", "0005_image_phash")]

    operations = [
        migrations.AddField(
            model_name="image",
            name="gallery_ready",
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name="image",
            name="preview_ready",
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name="image",
            name="thumbnail_ready",
            field=models.BooleanField(default=False),
        ),
    ]
