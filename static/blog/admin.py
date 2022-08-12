from django.contrib import admin
from blog.models import *
from django.core.mail import send_mail
from XiRanBlogV2.settings import EMAIL_HOST_USER
from threading import Thread


# Register your models here.

class FeedBackAdmin(admin.ModelAdmin):
    list_display = ['email', 'content', 'status', 'response_content']

    readonly_fields = ['email', 'content', 'status']

    def has_add_permission(self, request):
        return False

    def save_model(self, request, obj, form, change):
        if change:
            email = obj.email
            content = obj.content
            res_text = form.data.get('response_content')
            obj.status = True
            Thread(target=send_mail,
                   args=(f'【XiRan博客】回复您反馈的{content}', res_text, EMAIL_HOST_USER, [email, ], False)).start()
        return super(FeedBackAdmin, self).save_model(request, obj, form, change)


admin.site.register(Banner)
admin.site.register(Article)
admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(UserInfo)
admin.site.register(Avatar)
admin.site.register(Feedback, FeedBackAdmin)
