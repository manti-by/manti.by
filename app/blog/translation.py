from modeltranslation.translator import translator, TranslationOptions
from blog.models import Post


class PostTranslationOptions(TranslationOptions):
    fields = ('name', 'meta', 'summary', 'description' )


translator.register(Post, PostTranslationOptions)