from django.http import HttpResponse
from django.template import Context, loader


def index(request):
    t = loader.get_template('android/index.html')
    c = Context()
    return HttpResponse(t.render(c))
    