# Generated by Django 1.10.7 on 2017-07-17 12:18

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [("gallery", "0008_auto_20170512_1151")]

    operations = [
        migrations.AddField(
            model_name="gallery",
            name="name_by",
            field=models.CharField(max_length=255, null=True),
        )
    ]