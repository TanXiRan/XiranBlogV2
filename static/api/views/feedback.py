from django import forms
from django.http import JsonResponse
from blog.models import Feedback
from django.views import View
from api.utils.ErrorField import get_error_field


class FeedbackForm(forms.Form):
    email = forms.EmailField(error_messages={'required': '请输入联系邮箱'})
    content = forms.CharField(error_messages={'required': '请输入反馈内容'})


class FeedbackView(View):
    def post(self, request):
        res = {
            'code': 402,
            'msg': '反馈成功',
            'error_field': None,
        }
        data = request.data
        print(data)
        cleaned_data = FeedbackForm(data)
        if not cleaned_data.is_valid():
            res = get_error_field(cleaned_data, res)
            return JsonResponse(res)
        try:
            Feedback.objects.create(**data)
            res['code'] = 200
        except Exception as e:
            res['msg'] = e
        return JsonResponse(res)
