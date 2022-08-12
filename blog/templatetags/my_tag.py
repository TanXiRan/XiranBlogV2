from django import template

from django.utils.safestring import mark_safe
from blog.models import Banner, Tag
from blog.utils.sort_search.mySort import Sorter

register = template.Library()


@register.inclusion_tag('my_tag/headers.html')
def banner(banner_cat, article_=None, request=None, rotation=True, interval=5):
    if not article_:
        banner_qs = Banner.objects.filter(category=banner_cat).all()
        if not rotation:
            banner_interval = 0
        else:
            banner_interval = interval
    else:
        pics_list = [article_.cover.url]
    return locals()


@register.simple_tag
def get_order_fields(request, category):
    order_lis = []

    if category == 'most':
        order_lis = [
            ('-like_num', '综合排序'),
            ('-release_date', '最新发布'),
            ('-like_num', '最多点赞'),
            ('-comm_num', '最多评论'),
            ('-scan_num', '最多浏览'),
            ('-share_num', '最多分享')
        ]

    elif category == 'word':
        order_lis = [
            ('[0, 100000]', '全部字数'),
            ('[0, 100]', '100字以内'),
            ('[100, 500]', '500字以内'),
            ('[500, 1000]', '1000字以内'),
            ('[1000, 3000]', '3000字以内'),
            ('[3000, 5000]', '5000字以内'),
        ]

    elif category == 'tag':
        tags = Tag.objects.exclude(article__isnull=True)
        order_lis.append(('all_tags', '所有标签'))
        for tag in tags:
            order_lis.append((tag.id, tag.name))

    params = request.GET.copy()
    sorter = Sorter(order_lis, category, params)
    return mark_safe(sorter.get_order_list())
