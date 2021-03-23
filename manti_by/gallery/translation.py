from modeltranslation.translator import translator, TranslationOptions
from manti_by.gallery.models import Gallery


class GalleryTranslationOptions(TranslationOptions):
    fields = ("name",)


translator.register(Gallery, GalleryTranslationOptions)
