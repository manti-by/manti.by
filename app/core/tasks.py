from __future__ import absolute_import, unicode_literals

from celery.task import task


@task
def convert_to_mp3_preview(filename):
    return filename


@task
def convert_to_ogg_preview(filename):
    return filename


@task
def convert_to_ogg_release(filename):
    return filename
