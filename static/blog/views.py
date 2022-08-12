from django.shortcuts import render
from blog.models import Article, Avatar, Tag, UserInfo
from blog.utils.paging.myPager import Pager
from django.contrib import auth
from blog.utils.check_login.check import *


def index(request):
    try:
        article_qs = Article.objects.filter(is_active=True).all().order_by('-release_date')
        pager = Pager(current_page=request.GET.get('page'), total_articles=article_qs.count(),
                      base_url=request.path_info,
                      query_params=request.GET.copy(), per_page_article_number=2, max_page_number=5)
        article_qs = article_qs[pager.start:pager.end]
    except Exception as e:
        print(e)

    return render(request, 'index/index.html', locals())


def login(request):
    return render(request, 'login_register/login.html')


def register(request):
    return render(request, 'login_register/register.html')


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/blog/')


def article(request, a_id):
    article_qs = Article.objects.filter(id=a_id)
    if article_qs.count() == 1:
        article_ = article_qs.first()
        category = article_.category
        sam_cat_arts = Article.objects.filter(category=category)
        if sam_cat_arts.count() > 1:
            sam_cat_arts = list(sam_cat_arts)
            art_index = sam_cat_arts.index(article_)

            if 0 < art_index < len(sam_cat_arts) - 1:
                pre_art = sam_cat_arts[art_index - 1]
                next_art = sam_cat_arts[art_index + 1]
            elif art_index == 0:
                pre_art = None
                next_art = sam_cat_arts[art_index + 1]
            elif art_index == len(sam_cat_arts) - 1:
                pre_art = sam_cat_arts[art_index - 1]
                next_art = None

        recommendation = Article.objects.filter(category=category).exclude(id=a_id).order_by('-release_date')[:5]

        # sam_cat_arts = Article.objects.filter(category=category).exclude(id=a_id).order_by('-release_date')
        # print(sam_cat_arts)
        # recommendation = sam_cat_arts[:5]
        # if sam_cat_arts.count() > 1:
        #     sam_cat_arts = list(sam_cat_arts)
        #     art_index = sam_cat_arts.index(article_)
        #     if 0 < art_index < len(sam_cat_arts) - 1:
        #         pre_art = sam_cat_arts[art_index - 1]
        #         next_art = sam_cat_arts[art_index + 1]
        #     elif art_index == 0:
        #         pre_art = None
        #         next_art = sam_cat_arts[art_index + 1]
        #     elif art_index == len(sam_cat_arts) - 1:
        #         pre_art = sam_cat_arts[art_index - 1]
        #         next_art = None

        comments = article_.comment_set.all()
        users = set(UserInfo.objects.filter(comment__article=a_id))

        # u_set = set()
        # for c in comments:
        #     if c.user_id:
        #         u_set.add(c.user_id)
        # users = len(u_set)

        return render(request, 'article/article.html', locals())
    else:
        return HttpResponseRedirect('/')


@is_login_fun
def add_article(request):
    tags = Tag.objects.all()
    categories = (
        (1, '学习分享'),
        (2, '生活日常'),
        (3, '好物推荐'),
    )
    return render(request, 'article/add_article.html', locals())


@is_login_fun
def edit_article(request, aid):
    try:
        article_ = Article.objects.filter(id=aid).first()
        tags = Tag.objects.all()
        tags_ = [str(t.id) for t in article_.tags.all()]
        categories = (
            (1, '学习分享'),
            (2, '生活日常'),
            (3, '好物推荐'),
        )
        return render(request, 'article/edit_article.html', locals())
    except Exception as e:
        print(e)
        return HttpResponseRedirect('/blog/')


def learning(request):
    tags = Tag.objects.all().filter(category=1).exclude(article__isnull=True)
    tag_names = list(tags.values_list('name', flat=True))
    print(tag_names)
    return render(request, 'learning/learning.html', locals())


def daily_life(request):
    tags = Tag.objects.all().filter(category=2).exclude(article__isnull=True)
    tag_names = list(tags.values_list('name', flat=True))
    return render(request, 'dailyLife/dailyLife.html', locals())


def recommendations(request):
    tags = Tag.objects.all().filter(category=3).exclude(article__isnull=True)
    tag_names = list(tags.values_list('name', flat=True))
    return render(request, 'recommendations/recommendations.html', locals())


def search_view(request):
    query_params = request.GET.copy()
    search_content = query_params.get('key', '')
    most_field = query_params.get('most', '')
    word_field = query_params.get('word', '')
    tag_field = query_params.get('tag', '')

    most_fields = ['-like_num', '-release_date', '-like_num', '-comm_num', '-scan_num', '-share_num']
    word_fields = ['[0, 100000]', '[0, 100]', '[100, 500]', '[500, 1000]', '[1000, 3000]', '[3000, 5000]']
    tag_fields = [str(t.id) for t in Tag.objects.exclude(article__isnull=True)]

    if search_content:

        article_qs = Article.objects.filter(title__contains=search_content, is_active=True)

        if most_field and most_field in most_fields:
            article_qs = article_qs.order_by(most_field)

        if word_field and word_field in word_fields:
            article_qs = article_qs.filter(like_num__range=eval(word_field))

        if tag_field and tag_field in tag_fields:
            article_qs = article_qs.filter(tags=tag_field)

        pager = Pager(
            current_page=request.GET.get('page'),
            total_articles=article_qs.count(),
            base_url=request.path_info,
            query_params=request.GET.copy(),
            per_page_article_number=3,
            max_page_number=5
        )
        article_qs = article_qs[pager.start:pager.end]
    return render(request, 'search/search.html', locals())


@is_login_fun
def user_space(request):
    avatar_list = Avatar.objects.all()
    return render(request, 'user_space/user_space.html', locals())


def about(request):
    article_ = Article.objects.get(id=49)
    return render(request, 'about/about.html', locals())
