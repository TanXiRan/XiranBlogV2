import datetime
from django import template
import pendulum

register = template.Library()


# 记录导航栏的active
@register.filter
def locate_nav(path_info, name):
    nav_name = path_info.replace('/', '').replace('blog', '')
    if nav_name == name:
        return 'nav-active'
    return ''


# 格式化时间
@register.filter
def format_create_date(create_date: datetime.datetime):
    pendulum.set_locale('zh')
    time_difference = pendulum.parse(create_date.strftime('%Y-%m-%d %H:%M:%S')).diff_for_humans()
    return time_difference


# 这个是1.0版本的个人空间标记侧边栏
@register.filter
def mark_aside(path_info, name):
    option_name = path_info.replace('/', '').replace('bloguser_space', '')
    if option_name == name:
        return 'active'
    return ''


# 判断是否有搜索结果
@register.filter
def has_article(article_qs):
    if len(article_qs) > 0:
        return 'search-result'
    else:
        return 'no-result'
