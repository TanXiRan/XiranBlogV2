# Generated by Django 4.0.3 on 2022-06-21 05:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_delete_banner_delete_sentence'),
    ]

    operations = [
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('path', models.ImageField(upload_to='banner/', verbose_name='轮播图')),
                ('category', models.CharField(choices=[('index', '首页'), ('learning', '学习分享'), ('life', '生活日常'), ('recommendation', '好物推荐')], default='index', max_length=32, verbose_name='文章分类')),
                ('rotation', models.BooleanField(default=True, verbose_name='是否轮播')),
                ('interval', models.IntegerField(default=5, help_text='单位是秒，默认是5秒', verbose_name='轮播时间间隔')),
                ('sentence', models.CharField(max_length=128, verbose_name='配图句子')),
                ('st_source', models.CharField(max_length=32, verbose_name='句子来源')),
            ],
            options={
                'verbose_name_plural': '轮播图',
            },
        ),
    ]