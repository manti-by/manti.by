from __future__ import absolute_import, unicode_literals

import subprocess

from celery.task import task


def convert(command, original, destination):
    subprocess.call(command % (original, destination))


@task
def convert_to_mp3_preview(filename):
    result = filename.replace('release', 'preview')
    command = 'ffmpeg -i %s -acodec libmp3lame -t 1800 -ac 1 -ab 96k -ar 44100 -af "afade=t=out:st=1770:d=30" %s'
    convert(command, filename, result)


@task
def convert_to_ogg_preview(filename):
    result = filename.replace('release', 'preview').replace('mp3', 'ogg')
    command = 'ffmpeg -i %s -acodec libvorbis -t 1800 -ac 1 -ab 96k -af "afade=t=out:st=1770:d=30" %s'
    convert(command, filename, result)


@task
def convert_to_ogg_release(filename):
    result = filename.replace('mp3', 'ogg')
    command = 'ffmpeg -i %s -acodec libvorbis -ab 320k %s'
    convert(command, filename, result)
