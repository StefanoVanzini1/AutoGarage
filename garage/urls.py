from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("registrazione/", views.registrazione, name="registrazione"),
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("catalogo/", views.catalogo, name="catalogo"),
]