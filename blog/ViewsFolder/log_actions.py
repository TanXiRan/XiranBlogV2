from django.contrib import auth
from django.http import HttpResponseRedirect
from django.shortcuts import render


# 登录页
def login(request):
    return render(request, 'login_register/login.html')


# 注册页
def register(request):
    return render(request, 'login_register/register.html')


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/blog/')


def is_login(request):
    if request.user.username:
        return True
    return False
