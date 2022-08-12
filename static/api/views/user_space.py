import time

from django.http import JsonResponse, HttpResponse
from django import forms
from django.contrib import auth

from blog.models import UserInfo, Avatar
from api.utils.VerificationCode import *
from django.views import View
from api.utils.ErrorField import get_error_field
import random
from django.core.mail import send_mail
from XiRanBlogV2.settings import EMAIL_HOST_USER
from threading import Thread


class ChangePWDForm(forms.Form):
    # 重写__init__方法
    def __init__(self, *args, **kwargs):
        # print(kwargs)
        # 使用pop函数得到request请求
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    old_pwd = forms.CharField(error_messages={'required': '请输入原密码'})
    pwd = forms.CharField(min_length=6, max_length=18,
                          error_messages={'required': '输入新密码', 'min_length': '请输入6至18位长度的密码',
                                          'max_length': '请输入6至18位长度的密码'})
    re_pwd = forms.CharField(min_length=6, max_length=18,
                             error_messages={'required': '再次输入新秘密', 'min_length': '请输入6至18位长度的密码',
                                             'max_length': '请输入6至18位长度的密码'})

    def clean(self):
        pwd = self.cleaned_data.get('pwd')
        re_pwd = self.cleaned_data.get('re_pwd')

        if pwd != re_pwd:
            self.add_error('re_pwd', '两次输入的密码不一致')
        return pwd, re_pwd

    def clean_old_pwd(self):
        old_pwd = self.cleaned_data.get('old_pwd')
        user = auth.authenticate(username=self.request.user.username, password=old_pwd)
        if not user:
            self.add_error('old_pwd', '原密码输入错误')
        return old_pwd


class ChangePWDView(View):
    def post(self, request):
        res = {
            'msg': '密码修改成功！',
            'code': 402,
            'error_field': ''
        }
        print(request.data)
        data = request.data
        cleaned_form = ChangePWDForm(data, request=request)
        if not cleaned_form.is_valid():
            res = get_error_field(cleaned_form, response=res)
            return JsonResponse(res)
        user = request.user
        user.set_password(data['pwd'])
        user.save()
        auth.logout(request)
        res['code'] = 200
        return JsonResponse(res)


class UsernameForm(forms.Form):
    new_username = forms.CharField(max_length=30, error_messages={'required': '请输入新昵称', 'max_length': '昵称长度不能超过30字'})

    def clean(self):
        new_username = self.cleaned_data.get('new_username')
        check_username = UserInfo.objects.filter(username=new_username)
        if check_username:
            self.add_error('new_username', '哎呀！昵称被占用了，重新输入吧')
        return self.cleaned_data


class ChangeUsernameView(View):
    def post(self, request):
        res = {
            'msg': '修改成功！',
            'code': 402,
            'error_field': '',
        }
        data = request.data
        print(data)
        cleaned_form = UsernameForm(data)
        if not cleaned_form.is_valid():
            res = get_error_field(cleaned_form, response=res)
            return JsonResponse(res)
        try:
            user_qs = UserInfo.objects.filter(id=request.user.id)
            if user_qs.count() == 1:
                user_qs.update(username=data['new_username'])
                res['code'] = 200
        except Exception as e:
            res['msg'] = e
            print(e)
        return JsonResponse(res)


class ChangeAvatarView(View):
    def post(self, request):
        res = {
            'msg': '修改成功！',
            'code': 402,
            'avatar_url': '',
        }
        new_avatar_id = request.data.get('avatar_id')
        print(new_avatar_id, isinstance(new_avatar_id, int))
        try:
            user_qs = UserInfo.objects.filter(id=request.user.id)
            if user_qs.count() == 1:
                user_qs.update(avatar_id=new_avatar_id)
                res['code'] = 200
                res['avatar_url'] = user_qs.first().avatar.path.url
        except Exception as e:
            res['msg'] = e
            print(e)
        return JsonResponse(res)


class MailForm(forms.Form):
    mail = forms.EmailField(error_messages={'required': '请输入邮箱！', 'invalid': '请输入正确的邮箱！'})

    def clean_mail(self):
        mail = self.cleaned_data.get('mail')
        user_qs = UserInfo.objects.filter(email=mail)
        if user_qs:
            self.add_error('mail', '该邮箱已被其他用户绑定')
        return mail


class SendMailCodeView(View):
    def post(self, request):
        res = {
            'msg': '验证码发送成功，注意查看！',
            'code': 402,
            'error_field': '',
        }
        data = request.data
        print(data)
        clean_form = MailForm(data)
        if not clean_form.is_valid():
            res = get_error_field(clean_form, response=res)
            return JsonResponse(res)

        # 生成随机验证码
        var_code = ''.join(random.sample('0123456789', 6))

        # 使用多线程，可以实现异步发送，解决发送邮箱的时间阻塞
        Thread(target=send_mail,
               args=('【web获取邮箱验证码】', f'你的验证码是{var_code}', EMAIL_HOST_USER, [data['mail']], False)).start()

        # send_mail(
        #     subject='【web获取邮箱验证码】',
        #     message=f'你的验证码是{mail_code}',
        #     from_email=EMAIL_HOST_USER,
        #     recipient_list=[data['mail']]
        # )
        # 将验证码存入session中
        request.session['mail_code_obj'] = {
            'mail': data['mail'],
            'var_code': var_code,
            'time_stamp': time.time(),
        }
        res['code'] = 200
        return JsonResponse(res)


class BindMailForm(MailForm):
    var_code = forms.CharField(error_messages={'required': '请输入验证码'})


class BindMailView(View):
    def post(self, request):
        res = {
            'msg': '绑定成功！',
            'code': 402,
            'error_field': '',
        }
        data = request.data
        clean_form = BindMailForm(data)
        if not clean_form.is_valid():
            res = get_error_field(clean_form, response=res)
            return JsonResponse(res)
        mail_code_obj = request.session.get('mail_code_obj')
        if mail_code_obj:
            if data['mail'] != mail_code_obj['mail']:
                res['msg'] = '邮箱输入错误'
                res['error_field'] = 'mail'
            elif data['var_code'] != mail_code_obj['var_code']:
                res['msg'] = '验证码错误'
                res['error_field'] = 'var_code'
            elif time.time() - mail_code_obj['time_stamp'] > 60:
                res['msg'] = '验证码已失效'
                res['error_field'] = 'var_code'
            else:
                try:
                    user_qs = UserInfo.objects.filter(id=int(request.user.id))
                    if user_qs.count() == 1:
                        user_qs.update(email=data['mail'])
                        res['code'] = 200
                except Exception as e:
                    print(e)
                    res['msg'] = '绑定失败，请刷新页面后重试！'
        else:
            res['msg'] = '绑定失败，请刷新页面后重试！'
            res['error_field'] = 'mail'
        return JsonResponse(res)
