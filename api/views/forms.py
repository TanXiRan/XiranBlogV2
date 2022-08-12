from django import forms
from blog.models import Article


class ArticleFormWithFileField(forms.ModelForm):
    class Meta:
        model = Article
        # fields = ('title', 'cover')
        fields = '__all__'
