from django.conf.urls.defaults import patterns, include, url
from django.conf import settings

from hello_view import hello
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'JScallNative.views.home', name='home'),
    # url(r'^JScallNative/', include('JScallNative.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
    url(r'^$', hello),
    url(r'^iphone/', include('JScallNative.iphone.urls')),
    url(r'^android/', include('JScallNative.android.urls')),
    url(r'^wp7/', include('JScallNative.wp7.urls')),
)

urlpatterns += patterns('',
    (r'site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
)
