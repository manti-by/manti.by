# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-04-20 08:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gallery', '0003_auto_20170419_1519'),
    ]

    operations = [
        migrations.AddField(
            model_name='gallery',
            name='name_en',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='gallery',
            name='name_ru',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
