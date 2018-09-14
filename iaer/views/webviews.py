import pdb

from rest_framework.authtoken.models import Token
from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from iaer.models import User, RedEnvelope, Iaer
from iaer.utils import save_error_log
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

    def post(self, request, *args, **kwargs):

        pdb.set_trace()


def iaer_add(request):
    if request.method == 'POST':
        try:
            category = request.POST.get('category')
            if int(request.POST.get('type')) == 0:
                money = 0 - int(request.POST.get('money'))
            else:
                money = int(request.POST.get('money'))
            remark = request.POST.get('remark')
            token = request.session['token']
            user = get_user_by_token(token)

            if user:
                iaer = Iaer()
                iaer.user = User.objects.get(auth_user=user)
                iaer.money = money
                iaer.category = category
                iaer.remark = remark
                iaer.created = timezone.now()
                iaer.save()

                return redirect(reverse('iaer:iaer-list', args=(iaer.user.id,)))
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    return render(request, 'iaer_add.html')

class IaerDeleteView(DeleteView):
    model = Iaer

    def get_success_url(self):
        return reverse_lazy('iaer:iaer-list', args=(self.object.user_id,))

