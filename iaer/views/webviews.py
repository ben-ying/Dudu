import pdb

from rest_framework.authtoken.models import Token
from django.shortcuts import render
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


class UserListView(ListView):
    model = User
    template_name = 'index.html'

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


class IaerDetailView(DeleteView):
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
                category = self.request.POST.get('category')
                if category == '收入':
                    money = int(self.request.POST.get('money'))
                else:
                    money = 0 - int(self.request.POST.get('money'))
                remark = self.request.POST.get('remark')
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

