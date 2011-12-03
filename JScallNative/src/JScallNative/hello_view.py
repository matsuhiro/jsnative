from django.http import HttpResponse

def hello(request):
    message = "<html><body>Hello!!</body></html>"
    return HttpResponse(message)