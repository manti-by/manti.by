# Generated by Django 5.1.6 on 2025-02-18 14:34

import manti_by.apps.core.utils
import taggit.managers
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("taggit", "0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx"),
    ]

    operations = [
        migrations.CreateModel(
            name="Image",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("created", models.DateTimeField(auto_now_add=True, verbose_name="Created, UTC")),
                ("updated", models.DateTimeField(auto_now=True, verbose_name="Updated, UTC")),
                (
                    "original_image",
                    models.ImageField(
                        blank=True, null=True, upload_to=manti_by.apps.core.utils.original_name, verbose_name="Image"
                    ),
                ),
                ("order", models.IntegerField(blank=True, default=0)),
                (
                    "tags",
                    taggit.managers.TaggableManager(
                        blank=True,
                        help_text="A comma-separated list of tags.",
                        through="taggit.TaggedItem",
                        to="taggit.Tag",
                        verbose_name="Tags",
                    ),
                ),
            ],
            options={
                "verbose_name": "image",
                "verbose_name_plural": "images",
            },
        ),
    ]
