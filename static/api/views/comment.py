from django import forms
from django.http import JsonResponse
from django.views import View
from api.utils.ErrorField import get_error_field
from blog.models import Article, Comment
from django.db.models import F


class CommentForm(forms.Form):
    content = forms.CharField(error_messages={'required': '请输入评论内容！'})


class CommentView(View):
    def post(self, request, aid):
        res = {
            'msg': "发布成功！",
            'code': 402,
            'error_field': '',
        }
        if not request.user.username:
            res['msg'] = '登录后才能评论哦！'
            res['error_field'] = 'comment'
            return JsonResponse(res)
        print(request.data)
        data: dict = request.data
        data['user_id'] = request.user.id
        data['article_id'] = aid
        print(data)
        form = CommentForm(data)
        if not form.is_valid():
            res = get_error_field(form, response=res)
            return JsonResponse(res)
        try:
            comment = Comment.objects.create(**request.data)
            Article.objects.filter(id=aid).update(comm_num=F('comm_num') + 1)
            res['code'] = 200
        except Exception as e:
            print(e)
            res['msg'] = '发布失败！'
        return JsonResponse(res)


class DeleteCommentView(View):
    def delete(self, request, cid):
        res = {
            'msg': '删除成功！',
            'code': 402,
        }
        try:
            Comment.objects.filter(id=cid).delete()
            Article.objects.filter(id=request.data['aid']).update(comm_num=F('comm_num') - 1)
            res['code'] = 200
            res['comm_num'] = Article.objects.filter(id=request.data['aid']).first().comm_num
        except Exception as e:
            res['msg'] = '删除失败！'
            print(e)
        return JsonResponse(res)


class LikeCommentView(View):
    def post(self, request, cid):
        res = {
            'msg': '点赞成功！',
            'code': 200,
        }
        if not request.user.username:
            res['msg'] = '登录后才能点赞哦！'
            res['code'] = 402
        try:
            Comment.objects.filter(id=cid).update(like_num=F('like_num') + 1)
            res['like_count'] = Comment.objects.filter(id=cid).first().like_num
        except Exception as e:
            print(e)
            res['msg'] = '点赞失败！'
            res['code'] = 402
        return JsonResponse(res)
