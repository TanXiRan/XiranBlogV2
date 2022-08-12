"""
from django.contrib.auth.decorators import login_required
可以使用Django自带的登录校验

"""
from django.http import HttpResponseRedirect


# 使用装饰器校验登录状态


# 函数装饰器
def is_login_fun(fun):
    def inner(*args, **kwargs):
        request = args[0]
        if not request.user.is_superuser:
            return HttpResponseRedirect('/blog/')
        return fun(*args, **kwargs)

    return inner


# 类方法装饰器
def is_login_method(method):
    def inner(*args, **kwargs):
        request = args[1]
        if not request.user.is_superuser:
            return HttpResponseRedirect('/blog/')
        return method(*args, **kwargs)

    return inner
