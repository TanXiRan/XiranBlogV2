# Generated by Django 4.0.3 on 2022-06-21 05:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Banner',
        ),
        migrations.DeleteModel(
            name='Sentence',
        ),
    ]
