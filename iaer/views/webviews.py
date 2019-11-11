import pdb

from rest_framework.authtoken.models import Token
from django.http import HttpResponse
from django.shortcuts import render
from django.shortcuts import redirect
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic.edit import DeleteView
from django.utils import timezone
from django.urls import reverse_lazy

from iaer.models import User, RedEnvelope, Iaer
from iaer.utils import save_error_log
from iaer.utils import get_user_by_token
from iaer.forms.iaer import IaerForm


def index(request):
    '''
    for iaer in Iaer.objects.all():
        if not iaer.date:
            iaer.date = iaer.created.date()
            iaer.save()
    '''
    return HttpResponse("Index")
    #return redirect('iaer:users')

class UserListView(ListView):
    model = User
    template_name = 'iaer_users.html'

    def get_context_data(self, **kwargs):
        """
        i = 0
        for iaer in Iaer.objects.all().order_by('id'):
            i+=1
            Iaer.objects.filter(id = iaer.id).update(id = i)
            if iaer.category == '生活用品':
                iaer.category = '生活日用'
            elif iaer.category == '服饰':
                iaer.category = '服饰美容'
            elif iaer.category == '餐饮':
                iaer.category = '饮食'
            elif iaer.category == '孩子':
                iaer.category = '小孩其他'
            elif iaer.category == '其他':
                iaer.category = '其他消费'
            elif iaer.category == '其它':
                iaer.category = '其他消费'
            iaer.save()
        """
        """
        i = 0
        for rer in RedEnvelope.objects.all().order_by('id'):
            i+=1
            RedEnvelope.objects.filter(id = rer.id).update(id = i)
        """
        context = super().get_context_data(**kwargs)

        return context


class IaerListView(ListView):
    model = Iaer
    template_name = 'iaers.html'

    def get_queryset(self):
        user = User.objects.get(id = self.kwargs['pk'])
        try:
            self.request.session['token'] = Token.objects.get(user = user.auth_user).key
            return Iaer.objects.filter(user = user)
        except Exception as e:
            return save_error_log(self.request, e)


class IaerDetailView(DetailView):
    model = Iaer
    template_name = 'iaer_detail.html'


class IaerCreateView(CreateView):
    form_class = IaerForm
    template_name = 'iaer_add.html'

    def get_success_url(self):
        return reverse_lazy('iaer:iaer-list', args=(self.object.user_id,))

    def form_valid(self, form):
        if form.is_valid():
            try:
                category = form.cleaned_data['category']
                if category == '收入':
                    money = form.cleaned_data['money']
                else:
                    money = 0 - form.cleaned_data['money']
                remark = form.cleaned_data['remark']
                token = self.request.session['token']
                user = get_user_by_token(token)

                if user:
                    iaer = form.save(commit=False)
                    iaer.user = User.objects.get(auth_user=user)
                    iaer.money = money
                    iaer.category = category
                    iaer.remark = remark
                    iaer.created = timezone.now()
                    iaer.save()
                    self.object = iaer;

                    return super().form_valid(form)
                else:
                    return invalid_token_response()
            except Exception as e:
                return save_error_log(self.request, e)


class IaerDeleteView(DeleteView):
    model = Iaer

    def get_success_url(self):
        return reverse_lazy('iaer:iaer-list', args=(self.object.user_id,))

