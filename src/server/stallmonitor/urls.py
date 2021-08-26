from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('get/status', views.get_status, name='getstatus'),
    path('get/stalls', views.get_stalls, name='getstalls'),
    path('get/stallid', views.get_stall_id, name='getstallid'),
    path('get/stallmenu', views.get_stall_menu_from_id, name='getstallmenu'),
    path('get/stallmenu/all', views.get_stall_menu, name='getstallmenuall'),
    path('get/stallimage', views.get_image, name='getstallimage')
]
