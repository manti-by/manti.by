from manti_by.core.services import (
    convert_to_mp3_preview,
    convert_to_ogg_preview,
    convert_to_ogg_release,
)
from manti_by.core.utils import get_rq_queue

queue = get_rq_queue()


def generate_preview_for_post(post):
    if not post.release:
        return
    if not post.mp3_preview_ready:
        queue.enqueue(convert_to_mp3_preview, post.id)
    if not post.ogg_preview_ready:
        queue.enqueue(convert_to_ogg_preview, post.id)
    if not post.ogg_release_ready:
        queue.enqueue(convert_to_ogg_release, post.id)
