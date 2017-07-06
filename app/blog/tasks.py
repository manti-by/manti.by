from __future__ import unicode_literals

import subprocess

from celery.task import task


MP3_PREVIEW = 'mp3_preview'
OGG_PREVIEW = 'ogg_preview'
OGG_RELEASE = 'ogg_release'


def convert(ffmpeg_format, post_id, output_type=''):
    from blog.models import Post
    post = Post.objects.get(id=post_id)
    result = filename = str(post.release.file)

    if output_type in (MP3_PREVIEW, OGG_PREVIEW):
        result = result.replace('release', 'preview')
    if output_type in (OGG_RELEASE, OGG_PREVIEW):
        result = result.replace('mp3', 'ogg')

    ffmpeg_format.append(result)
    command = ['ffmpeg', '-y', '-nostats', '-loglevel', '0', '-i', filename] + ffmpeg_format
    subprocess.call(command)

    setattr(post, '%s_ready' % output_type, True)
    post.save()


@task
def convert_to_mp3_preview(post_id):
    format = ['-acodec', 'libmp3lame', '-t', '1800', '-ac', '1', '-ab', '96k',
              '-ar', '44100', '-af', '"afade=t=out:st=1770:d=30"']
    convert(format, post_id, MP3_PREVIEW)


@task
def convert_to_ogg_preview(post_id):
    command = ['-acodec', 'libvorbis', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-af', '"afade=t=out:st=1770:d=30"']
    convert(command, post_id, OGG_PREVIEW)


@task
def convert_to_ogg_release(post_id):
    command = ['-acodec', 'libvorbis', '-ab', '320k']
    convert(command, post_id, OGG_RELEASE)
