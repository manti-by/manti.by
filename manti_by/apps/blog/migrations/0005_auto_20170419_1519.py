# Generated by Django 1.10.7 on 2017-04-19 15:19

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [("blog", "0004_auto_20170419_1039")]

    operations = [
        migrations.AlterField(
            model_name="post",
            name="related",
            field=models.ManyToManyField(blank=True, related_name="_post_related_+", to="blog.Post"),
        )
    ]