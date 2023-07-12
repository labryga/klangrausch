from django.urls import path, include
from django.contrib import admin
from main import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('mainflex/', views.MainFlex.as_view()),
    path('main/', views.Main.as_view()),
    path("__reload__/", include("django_browser_reload.urls")),
]
