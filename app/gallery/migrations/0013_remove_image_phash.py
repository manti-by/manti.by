# -*- coding: utf-8 -*-
# Generated by Django 1.11.13 on 2018-07-06 09:26
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gallery', '0012_auto_20180619_1106'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='phash',
        ),
    ]