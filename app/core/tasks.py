import subprocess

from core.celery import app
from blog.constants import MP3_PREVIEW, OGG_PREVIEW, OGG_RELEASE


@app.task
def convert_to_mp3_preview(post_id):
    command = ['-acodec', 'libmp3lame', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-ar', '44100', '-af', '"afade=t=out:st=1770:d=30"']
    convert_release(command, post_id, MP3_PREVIEW)


@app.task
def convert_to_ogg_preview(post_id):
    command = ['-acodec', 'libvorbis', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-af', '"afade=t=out:st=1770:d=30"']
    convert_release(command, post_id, OGG_PREVIEW)


@app.task
def convert_to_ogg_release(post_id):
    command = ['-acodec', 'libvorbis', '-ab', '320k']
    convert_release(command, post_id, OGG_RELEASE)


def convert_release(ffmpeg_format, post_id, output_type=''):
    from blog.models import Post
    try:
        post = Post.objects.get(id=post_id)
    except Post.DoesNotExist:
        return

    if output_type == OGG_PREVIEW:
        result = post.preview_ogg_file
    elif output_type == OGG_RELEASE:
        result = post.release_ogg_file
    else:
        result = post.preview_mp3_file

    ffmpeg_format.append(result)
    command = ['ffmpeg', '-y', '-nostats', '-loglevel', '0', '-i', post.release_mp3_file] + ffmpeg_format
    subprocess.call(command)
