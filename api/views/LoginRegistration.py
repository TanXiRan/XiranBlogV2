from django.http import JsonResponse, HttpResponse
from django import forms
from django.contrib import auth

from blog.models import UserInfo, Avatar
from api.utils.VerificationCode import *
from django.views import View
from api.utils.ErrorField import get_error_field
import random


class BaseForm(forms.Form):
    username = forms.CharField(max_length=18, error_messages={'required': '请输入账号', 'max_length': '昵称不能超过18个字符'})
    password = forms.CharField(max_length=18,
                               error_messages={'required': '请输入密码', 'max_length': '密码不能超过18个字符，只能由数字、字母、以及下划线组成'})


class LoginForm(BaseForm):
    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        user = auth.authenticate(username=username, password=password)

        # error_times =

        if not user:
            self.add_error('username', '账号或密码错误')
        return self.cleaned_data


# 注册表单验证
class RegistrationForm(BaseForm):
    # 设定字段类型用来判断表单的字段是否合法
    repeat_password = forms.CharField(error_messages={'required': '请再次输入密码'})
    verification_strings = forms.CharField(error_messages={'required': '请输入验证码'})

    # 重写__init__方法
    def __init__(self, *args, **kwargs):
        # print(kwargs)
        # 使用pop函数得到request请求
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    # 全局钩子
    def clean(self):
        password = self.cleaned_data.get('password')
        repeat_password = self.cleaned_data.get('repeat_password')

        # 校验两次的密码是否一致
        if password != repeat_password:
            self.add_error('password', '两次输入的密码不一致')

        # 钩子函数必须返回cleaned_data
        return self.cleaned_data

    def clean_username(self):
        username = self.cleaned_data.get('username')
        check_username = UserInfo.objects.filter(username=username)
        if check_username:
            self.add_error('username', '此账号已注册')
            return self.cleaned_data

    # 局部钩子，用于校验验证码
    def clean_verification_strings(self):
        verification_strings = self.cleaned_data.get('verification_strings')
        print(verification_strings)
        print(self.request.session.get('verification_strings'))
        if verification_strings.upper() != self.request.session.get('verification_strings').upper():
            self.add_error('verification_strings', '验证码错误')
        return self.cleaned_data


# 获取验证码
def get_verification_strings(request):
    ft_path = 'static/font/AaLiFangTi.ttf'
    data, verification_strings = generate_code(f_path=ft_path)
    request.session['verification_strings'] = verification_strings
    return HttpResponse(data)


class LoginView(View):
    # 处理post注册请求
    def post(self, request):
        response = {
            'passed': False,
            'msg': '登录成功',
            'error_field': '',
        }
        data = request.data
        cleaned_form = LoginForm(data)
        if not cleaned_form.is_valid():
            response = get_error_field(cleaned_form, response)
            return JsonResponse(response)
        else:
            # user = UserInfo.objects.get(username=data.get('username'))
            user = auth.authenticate(username=data.get('username'), password=data.get('password'))
            auth.login(request, user)
            response['passed'] = True
            return JsonResponse(response)


class RegistrationView(View):
    # 处理post注册请求
    def post(self, request):
        # 返回给前端的响应数据
        response = {
            'passed': False,
            'msg': '注册成功',
            'error_field': None
        }
        # 提取post提交的表单数据
        data = request.data
        # print(data)
        # print(request.session.get('verification_strings'))
        # 使用SignInFrom判断表单数据是否合法
        cleaned_form = RegistrationForm(data, request=request)
        if not cleaned_form.is_valid():
            # 如果不合法，就定位出错的字段
            response = get_error_field(cleaned_form, response)
            return JsonResponse(response)
        else:
            user = UserInfo.objects.create_user(username=data.get('username'), password=data.get('password'))
            avatars = [avatar.nid for avatar in Avatar.objects.all()]
            if avatars:
                user.avatar_id = random.choice(avatars)
            user.save()

            auth.login(request, user)

            # 合法就令passed为True，返回给前端
            response['passed'] = True
            return JsonResponse(response)
