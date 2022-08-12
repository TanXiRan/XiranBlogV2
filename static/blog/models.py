from django.db import models
from django.contrib.auth.models import AbstractUser


# from django.utils.translation import gettext_lazy as _


class Site(models.Model):
    name = models.CharField(max_length=32, verbose_name='网站名称')
    abstract = models.CharField(max_length=128, verbose_name='网站摘要')
    key_words = models.CharField(max_length=128, verbose_name='网站关键字')
    filing = models.CharField(max_length=32, verbose_name='网站备案号')
    create_date = models.DateTimeField(verbose_name='建站日期')
    version = models.CharField(max_length=16, verbose_name='网站版本')
    icon = models.FileField(verbose_name='网站图标', upload_to='site_icon/')
    owner = models.ForeignKey(to='Owner', verbose_name='网站所有者', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '网站信息'


class Owner(models.Model):
    name = models.CharField(max_length=32, verbose_name='网站拥有人')
    avatar = models.ImageField(upload_to='Owner/avatar/', verbose_name='头像')
    abstract = models.CharField(max_length=128, verbose_name='个人介绍')
    region = models.CharField(max_length=32, verbose_name='所在地')
    school = models.CharField(max_length=32, verbose_name='就读学校')
    mail = models.EmailField(verbose_name='联系邮箱')
    tel = models.CharField(max_length=11, verbose_name='联系电话')
    qq_svg = models.ImageField(upload_to='Owner/svg/', help_text='QQ_svg')
    bili_svg = models.ImageField(upload_to='Owner/svg/', help_text='小破站svg')
    weixin_svg = models.ImageField(upload_to='Owner/svg/', verbose_name='微信svg')
    bili_href = models.URLField(verbose_name='小破站网址')
    qq_qr = models.ImageField(upload_to='Owner/qr_img/', verbose_name='QQ二维码')
    weixin_qr = models.ImageField(upload_to='Owner/qr_img/', verbose_name='微信二维码')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '网站所有者'


class Notice(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.CharField(max_length=255, verbose_name='公告內容')
    release_date = models.DateTimeField(auto_now=True, verbose_name='发布时间')
    level_choices = (
        (1, 'important'),
        (2, 'normal'),
        (3, 'weak'),
    )
    level = models.IntegerField(default=1, choices=level_choices, verbose_name='重要程度')
    is_active = models.BooleanField(default=True, verbose_name='正在发布中')

    def __str__(self):
        return self.content[:10]

    class Meta:
        verbose_name_plural = '网站公告'


class Feedback(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(verbose_name='回信邮箱')
    content = models.TextField(verbose_name='反馈信息')
    status = models.BooleanField(verbose_name='是否处理', default=False)
    response_content = models.TextField(verbose_name='回复内容', null=True, blank=True)

    def __str__(self):
        return self.content[:10]

    class Meta:
        verbose_name_plural = '用户反馈'


class Banner(models.Model):
    id = models.AutoField(primary_key=True)
    path = models.ImageField(upload_to='banner/', verbose_name='轮播图')
    category_choice = (
        ('index', '首页'),
        ('learning', '学习分享'),
        ('life', '生活日常'),
        ('recommendation', '好物推荐'),
    )
    category = models.CharField(max_length=32, choices=category_choice, default='index', verbose_name='文章分类')
    rotation = models.BooleanField(default=True, verbose_name='是否轮播')
    interval = models.IntegerField(verbose_name='轮播时间间隔', help_text='单位是秒，默认是5秒', default=5)
    sentence = models.CharField(max_length=128, verbose_name='配图句子')
    st_source = models.CharField(max_length=32, verbose_name='句子来源')

    def __str__(self):
        return self.path.url

    class Meta:
        verbose_name_plural = '轮播图'


# class Sentence(models.Model):
#     id = models.AutoField(primary_key=True)
#     content = models.CharField(max_length=128, verbose_name='句子内容')
#     source = models.CharField(max_length=32, verbose_name='来源')
#     category_choice = (
#         (1, '学习分享'),
#         (2, '生活日常'),
#         (3, '好物推荐'),
#     )
#     category = models.IntegerField(choices=category_choice, default=1, verbose_name='文章分类')
#     rotation = models.BooleanField(default=True, verbose_name='是否轮播')
#     interval = models.IntegerField(verbose_name='轮播时间间隔', help_text='单位是秒，默认是5秒', default=5)
#
#     def __str__(self):
#         return self.source[:10]
#
#     class Meta:
#         verbose_name_plural = '轮播句子'


class UserInfo(AbstractUser):
    id = models.AutoField(primary_key=True)
    tel = models.CharField(verbose_name='手机号', max_length=11, null=True, blank=True)
    avatar = models.ForeignKey(
        to='Avatar',
        to_field='id',
        on_delete=models.SET_NULL,
        verbose_name='用户头像',
        null=True
    )
    liked_article = models.ManyToManyField(to='Article', verbose_name='喜欢的文章', blank=True)
    account_status_choices = (
        (1, '账号正常'),
        (2, '账号异常'),
        (3, '账号被封禁'),
    )
    account_status = models.IntegerField(default=1, choices=account_status_choices, verbose_name='账号状态')

    like_num = models.IntegerField(default=0, verbose_name='点赞数')
    comm_num = models.IntegerField(default=0, verbose_name='评论数')
    share_num = models.IntegerField(default=0, verbose_name='分享数')
    scan_num = models.IntegerField(default=0, verbose_name='浏览量')

    def __str__(self):
        return self.username

    class Meta:
        verbose_name_plural = '用户'


class Avatar(models.Model):
    id = models.AutoField(primary_key=True)
    path = models.ImageField(upload_to='user_avatar/', verbose_name='用户头像路径')

    def __str__(self):
        return self.path.url

    class Meta:
        verbose_name_plural = '用户头像组'


class Article(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=32, verbose_name='文章标题')
    content = models.TextField(verbose_name='文章内容', blank=True, null=True)
    release_date = models.DateTimeField(auto_now_add=True, null=True, verbose_name='发布时间')
    alter_date = models.DateTimeField(auto_now=True, null=True, verbose_name='修改日期')
    like_num = models.IntegerField(default=0, verbose_name='点赞数')
    comm_num = models.IntegerField(default=0, verbose_name='评论数')
    share_num = models.IntegerField(default=0, verbose_name='分享数')
    scan_num = models.IntegerField(default=0, verbose_name='浏览量')
    category_choice = (
        (1, '学习分享'),
        (2, '生活日常'),
        (3, '好物推荐'),
    )
    category = models.IntegerField(choices=category_choice, default=1, verbose_name='文章分类')

    tags = models.ManyToManyField(to='Tag', verbose_name='文章标签', blank=True)

    recommend = models.BooleanField(verbose_name='推荐阅读', default=True)
    cover = models.ImageField(upload_to='Article_cover/', verbose_name='文章封面', blank=True, null=True)
    is_active = models.BooleanField(verbose_name='发布中', default=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '我的文章'


class Tag(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=32, verbose_name='标签名')
    category_choice = (
        (1, '学习分享'),
        (2, '生活日常'),
        (3, '好物推荐'),
    )
    category = models.IntegerField(choices=category_choice, default=1, verbose_name='标签的分类')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '文章标签'


class Comment(models.Model):
    id = models.AutoField(primary_key=True)
    like_num = models.IntegerField(verbose_name='点赞数', default=0)
    article = models.ForeignKey(verbose_name='评论的文章', to='Article', to_field='id', on_delete=models.CASCADE)
    user = models.ForeignKey(verbose_name='评论人', to='UserInfo', to_field='id', on_delete=models.CASCADE)
    content = models.TextField(verbose_name='评论内容')
    drawing = models.ImageField(upload_to='comment_drawing/', verbose_name='配图', null=True, blank=True)
    emoji = models.CharField(max_length=32, verbose_name='表情包', null=True, blank=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)

    def __str__(self):
        return self.content[:10]

    class Meta:
        verbose_name_plural = '评论'
