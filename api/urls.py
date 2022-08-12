from django.urls import path, re_path
from api.views import LoginRegistration, feedback, Article, user_space, comment, learning

app_name = 'blog_api'

urlpatterns = [
    # 登录操作
    path('login/', LoginRegistration.LoginView.as_view()),

    # 注册操作
    path('register/', LoginRegistration.RegistrationView.as_view()),

    # 获取验证码
    path('verification_code/', LoginRegistration.get_verification_strings),

    # 意见反馈
    path('feedback/', feedback.FeedbackView.as_view()),

    # 修改密码
    path('change_pwd/', user_space.ChangePWDView.as_view()),

    # 修改用户名
    path('change_username/', user_space.ChangeUsernameView.as_view()),

    # 修改头像
    path('change_avatar/', user_space.ChangeAvatarView.as_view()),

    # 绑定邮箱发送验证码
    path('send_mail_code/', user_space.SendMailCodeView.as_view()),

    # 绑定邮箱
    path('bind_mail/', user_space.BindMailView.as_view()),

    # 添加文章
    path('add_article/', Article.AddArticleView.as_view()),

    # 修改文章
    re_path(r'^edit_article/(?P<aid>\d+)/', Article.EditArticleView.as_view()),

    # 评论文章
    re_path(r'^comment/(?P<aid>\d+)/', comment.CommentView.as_view()),

    # 点赞文章
    re_path(r'^like_article/(?P<aid>\d+)/', Article.LikeArticleView.as_view()),

    # 删除评论
    re_path(r'^delete_comment/(?P<cid>\d+)/', comment.DeleteCommentView.as_view()),

    # 点赞评论
    re_path(r'^like_comment/(?P<cid>\d+)/', comment.LikeCommentView.as_view()),

    # 学习分享请求文章
    path('learning/', learning.TagView.as_view()),

    # 添加学习分享标签
    path('learning/add_tag/', learning.AddTagView.as_view()),
]
