from django.http import JsonResponse
from django.views import View
from blog.models import Article, UserInfo, Tag


class TagView(View):
    def get(self, request):
        tag = request.GET.get('tag', None)
        order = request.GET.get('sort', None)
        end = request.GET.get('end', None)

        data = {'end': '', 'art_infos': []}

        if tag:
            art_qs = Tag.objects.filter(name=tag)
            if art_qs:
                arts = art_qs.first().article_set.filter(is_active=True).order_by('-alter_date')

                if order:
                    arts = arts.order_by(f'-{order}')

                if arts.count() > 3 and end is None:
                    data['end'] = '3'
                    arts = arts[:3]
                    print(arts)

                if end and end != '':
                    end = int(end)
                    if end + 3 >= len(arts[end:]):
                        arts = arts[end:]
                        data['end'] = ''
                    else:
                        arts = arts[end: end + 3]
                        data['end'] = str(end + 3)

                for art in arts:
                    data['art_infos'].append({
                        'aid': art.id,
                        'title': art.title,
                        'content': art.content if len(art.content) < 200 else art.content[:100],
                        'like_num': art.like_num,
                        'alter_date': art.alter_date.strftime('%Y-%m-%d'),
                        'category': art.get_category_display(),
                        'tags': [t.name for t in art.tags.all()],
                        'cover': art.cover.url,
                        'href': ''.join(["/blog/article/", str(art.id), '/'])
                    })
            return JsonResponse(data, safe=False)

        return JsonResponse(data)


# class TagView(View):
#     def get(self, request):
#         tag = request.GET.get('tag', None)
#         order = request.GET.get('sort', None)
#         end = request.GET.get('end', None)
#
#         data = [{'end': '', 'art_infos': []}]
#
#         if tag:
#             art_qs = Tag.objects.filter(name=tag)
#             if art_qs:
#                 arts = art_qs.first().article_set.filter(is_active=True).order_by('-release_date')
#
#                 if order:
#                     arts = arts.order_by(f'-{order}')
#
#                 if arts.count() > 3 and end is None:
#                     data[0]['end'] = '3'
#                     arts = arts[:3]
#                     print(arts)
#
#                 if end and end != '':
#                     end = int(end)
#                     if end + 3 >= len(arts[end:]):
#                         arts = arts[end:]
#                         data[0]['end'] = ''
#                     else:
#                         arts = arts[end: end + 3]
#                         data[0]['end'] = str(end + 3)
#
#                 for art in arts:
#                     data[0]['art_infos'].append({
#                         'aid': art.id,
#                         'title': art.title,
#                         'content': art.content if len(art.content) < 200 else art.content[:51],
#                         'alter_date': art.alter_date.strftime('%Y-%m-%d'),
#                         'category': art.get_category_display(),
#                         'tags': [t.name for t in art.tags.all()],
#                         'cover': art.cover.url,
#                         'href': ''.join(["/blog/article/", str(art.id), '/'])
#                     })
#             return JsonResponse(data, safe=False)
#
#         return JsonResponse(data)


class AddTagView(View):
    def post(self, request):
        res = {
            'msg': '添加成功！',
            'code': 402,
            'error_field': None,
        }
        print(request.data)
        name = request.data.get('name', None)
        if not name:
            res['msg'] = '请输入新的标签名'
            res['error_field'] = 'new_tag'
            return JsonResponse(res)

        tag = Tag.objects.filter(name=name)
        if tag.count() > 0:
            res['msg'] = '标签已经存在，请重新输入'
            res['error_field'] = 'new_tag'
            return JsonResponse(res)
        try:
            Tag.objects.create(**request.data)
            res['code'] = 200
        except Exception as e:
            res['msg'] = '添加错误，请重试！'
            print(e)
            res['error_field'] = 'new_tag'
        return JsonResponse(res)
