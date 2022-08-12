from django.shortcuts import render
from blog.models import Article, Tag
from blog.utils.paging.myPager import Pager


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


def learning(request):
    tags = Tag.objects.all().filter(category=1).exclude(article__isnull=True)
    return render(request, 'learning/learning.html', locals())


def daily_life(request):
    tags = Tag.objects.all().filter(category=2).exclude(article__isnull=True)
    return render(request, 'dailyLife/dailyLife.html', locals())


def recommendations(request):
    tags = Tag.objects.all().filter(category=3).exclude(article__isnull=True)
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
