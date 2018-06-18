from core.tasks import convert_to_mp3_preview, \
    convert_to_ogg_preview, convert_to_ogg_release


def generate_preview_for_post(post):
    if not post.release:
        return
    if not post.mp3_preview_ready:
        convert_to_mp3_preview.delay(post.id)
    if not post.ogg_preview_ready:
        convert_to_ogg_preview.delay(post.id)
    if not post.ogg_release_ready:
        convert_to_ogg_release.delay(post.id)
