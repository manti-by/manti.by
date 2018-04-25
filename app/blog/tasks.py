import os
import subprocess

from celery import shared_task

from core.celery import app


@app.on_after_configure.connect
def setup_periodic_tasks(sender, **kwargs):
    sender.add_periodic_task(600.0, check_posts_state.s(),
                             name='Check Posts state every 10 minutes')


@app.task
def check_posts_state():
    from blog.models import Post
    for post in Post.objects.all():
        post.ogg_release_ready = os.path.exists(post.release_ogg_file) \
            and os.path.getsize(post.release_ogg_file) > 0

        post.mp3_preview_ready = os.path.exists(post.preview_mp3_file) \
            and os.path.getsize(post.preview_mp3_file) > 0

        post.ogg_preview_ready = os.path.exists(post.preview_ogg_file) \
            and os.path.getsize(post.preview_ogg_file) > 0

        post.save()


MP3_PREVIEW = 'mp3_preview'
OGG_PREVIEW = 'ogg_preview'
OGG_RELEASE = 'ogg_release'


def convert(ffmpeg_format, post_id, output_type=''):
    from blog.models import Post
    post = Post.objects.get(id=post_id)

    if output_type == OGG_PREVIEW:
        result = post.preview_ogg_file
    elif output_type == OGG_RELEASE:
        result = post.release_ogg_file
    else:
        result = post.preview_mp3_file

    ffmpeg_format.append(result)
    command = ['ffmpeg', '-y', '-nostats', '-loglevel', '0', '-i', post.release_mp3_file] + ffmpeg_format
    subprocess.call(command)

    setattr(post, '%s_ready' % output_type, True)
    post.save()


@shared_task
def convert_to_mp3_preview(post_id):
    format = ['-acodec', 'libmp3lame', '-t', '1800', '-ac', '1', '-ab', '96k',
              '-ar', '44100', '-af', '"afade=t=out:st=1770:d=30"']
    convert(format, post_id, MP3_PREVIEW)


@shared_task
def convert_to_ogg_preview(post_id):
    command = ['-acodec', 'libvorbis', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-af', '"afade=t=out:st=1770:d=30"']
    convert(command, post_id, OGG_PREVIEW)


@shared_task
def convert_to_ogg_release(post_id):
    command = ['-acodec', 'libvorbis', '-ab', '320k']
    convert(command, post_id, OGG_RELEASE)
