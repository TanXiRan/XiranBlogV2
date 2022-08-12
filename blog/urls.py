from django.urls import path, re_path
from . import views

app_name = 'api'

urlpatterns = [
    # 导航栏
    path('', views.index),
    path('learning/', views.learning),
    path('dailylife/', views.daily_life),
    path('recommendations/', views.recommendations),
    path('search/', views.search_view),

    # 登录注册
    path('login/', views.login),
    path('register/', views.register),
    path('logout/', views.logout),

    # 文章相关
    re_path(r'^article/(?P<a_id>\d+)/', views.article),
    path('add_article/', views.add_article),
    re_path(r'^edit_article/(?P<aid>\d+)/', views.edit_article),

    # path('user_space/', user_space.information),
    # path('user_space/add_article/', user_space.add_article),
    # re_path(r'^user_space/edit_article/(?P<aid>\d+)/', user_space.edit_article),

    # 个人中心
    path('user_space/', views.user_space),

    path('about/', views.about),

]
