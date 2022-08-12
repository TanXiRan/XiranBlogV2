from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib import auth
from blog.models import Article, Tag, Avatar, UserInfo
from blog.utils.paging.myPager import Pager
from .log_actions import is_login


def information(request):
    avatar_list = Avatar.objects.all()
    if not is_login(request):
        return HttpResponseRedirect('/blog/')
    else:
        return render(request, 'user_space/user_space.html', locals())


def add_article(request):
    tags = Tag.objects.all()
    categories = [c[1] for c in Article.category_choice]
    print(categories)
    return render(request, 'user_space/add_article.html', locals())


def edit_article(request, aid):
    article = Article.objects.filter(is_active=True, id=aid).first()
    if article:
        categories = Article.category_choice
        tags = Tag.objects.all()
        return render(request, 'user_space/edit_article.html', locals())
    else:
        return JsonResponse('不存在这篇文章')
