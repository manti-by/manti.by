# Generated by Django 3.2.7 on 2021-09-17 11:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("shortener", "0002_link_name"),
    ]

    operations = [
        migrations.AlterField(
            model_name="link",
            name="id",
            field=models.BigAutoField(
                auto_created=True, primary_key=True, serialize=False, verbose_name="ID"
            ),
        ),
    ]
