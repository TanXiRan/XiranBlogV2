import time

from django import forms
from django.db.models import F, Q
from django.http import JsonResponse
from django.views import View
from api.utils.ErrorField import get_error_field
from blog.models import Article, UserInfo, Tag
from .forms import ArticleFormWithFileField


class ArticleForm(forms.Form):
    title = forms.CharField(max_length=64, error_messages={'required': '请输入标题', 'max_length': '标题不能超过64个字'})
    content = forms.CharField(error_messages={'required': '请输入文章内容'})
    category = forms.IntegerField(min_value=1, error_messages={'required': '请输入文章分类', 'min_value': '文章分类不正确'})
    tags = forms.CharField(error_messages={'required': '请选择文章标签'})
    cover = forms.FileField(error_messages={'required': '请选择文章封面'})

    def clean(self):
        # title =
        return self.cleaned_data


class EditArticleForm(ArticleForm):
    cover = forms.FileField(required=False)

    def clean(self):
        return self.cleaned_data


def handle_uploaded_file(f):
    with open(f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


class AddArticleView(View):
    def post(self, request):
        res = {
            'msg': "发布成功！",
            'code': 402,
            'error_field': '',
            'article_href': '',
        }
        # form = ArticleForm(request.POST, request.FILES)
        form = ArticleForm(request.POST, request.FILES)
        print(request.POST)
        print(request.FILES)
        if not form.is_valid():
            res = get_error_field(form, response=res)
            return JsonResponse(res)
        try:
            # print(form.cleaned_data)
            tags = form.cleaned_data.pop('tags')
            article = Article.objects.create(**form.cleaned_data)
            for tag in tags.split(','):
                article.tags.add(tag)
            article.save()
            res['code'] = 200
            res['article_href'] = f'/blog/article/{article.id}/'
            # print(res)
        except Exception as e:
            # e.args是一个错误性信息的元组，不能直接用e,print(e)其实也是打印的e.args的内容
            res['msg'] = e.args
            # print(e)
            # print(res)
        return JsonResponse(res)


class EditArticleView(View):
    def post(self, request, aid):
        res = {
            'msg': '修改失败！',
            'code': 402,
            'error_field': '',
            'article_href': '',
        }
        # print(request.POST)
        # print(request.FILES)

        form = EditArticleForm(request.POST, request.FILES)
        if not form.is_valid():
            res = get_error_field(form, response=res)
            return JsonResponse(res)

        article_qs = Article.objects.filter(id=aid)
        if article_qs.count() != 1:
            return JsonResponse(res)
        try:
            tag_qs = Tag.objects.filter(article=aid)
            if tag_qs:
                for tag in tag_qs:
                    tag.article_set.remove(aid)

            tags = form.cleaned_data.get('tags').split(',')
            print(tags)

            cover_file = form.cleaned_data.get('cover', None)
            form.cleaned_data.pop('cover')

            form.cleaned_data.pop('tags')

            article_qs.update(**form.cleaned_data)

            art = article_qs.first()
            for t in tags:
                art.tags.add(t)
            if cover_file:
                art.cover = cover_file
            art.save()

            res['code'] = 200
            res['article_href'] = f'/blog/article/{aid}/'
        except Exception as e:
            print(e)
        return JsonResponse(res)

    def put(self, request, aid):
        res = {
            'msg': '修改失败！',
            'code': 402,
            'error_field': '',
            'article_href': '',
        }
        print(aid)
        print(request.PUT)
        print(request.FILES)
        return JsonResponse(res)


class LikeArticleView(View):
    def post(self, request, aid):
        res = {
            'code': 402,
        }
        if not request.user.username:
            res['msg'] = '请先登录！'
            return JsonResponse(res)
        before = request.session.get('now', None)
        now = int(time.time())
        if before:
            if now - int(before) < 2:
                res['msg'] = '请不要频繁点赞！'
                return JsonResponse(res)
        try:
            article = Article.objects.filter(id=aid)
            if article.count() == 1:
                article.update(like_num=F('like_num') + 1)
                article.first().userinfo_set.add(request.user.id)
                request.user.like_num += 1
                res['msg'] = '点赞成功！'
                res['code'] = 200
                res['like_num'] = article.first().like_num
                request.session['now'] = now
        except Exception as e:
            print(e)
            res['msg'] = '点赞失败'
        return JsonResponse(res)
