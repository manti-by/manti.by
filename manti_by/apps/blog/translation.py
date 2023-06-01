from modeltranslation.translator import TranslationOptions, translator

from manti_by.apps.blog.models import Post


class PostTranslationOptions(TranslationOptions):
    fields = ("name", "meta", "summary", "description")


translator.register(Post, PostTranslationOptions)
