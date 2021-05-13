from modeltranslation.translator import translator, TranslationOptions
from manti_by.apps.gallery.models import Gallery


class GalleryTranslationOptions(TranslationOptions):
    fields = ("name",)


translator.register(Gallery, GalleryTranslationOptions)
