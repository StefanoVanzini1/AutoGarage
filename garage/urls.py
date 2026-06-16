from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("registrazione/", views.registrazione, name="registrazione"),
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("catalogo/", views.catalogo, name="catalogo"),
    path("catalogo/<int:auto_id>/", views.dettaglio_auto, name="dettaglio_auto"),
    path("catalogo/<int:auto_id>/prenota-test-drive/", views.prenota_test_drive, name="prenota_test_drive"),
    path("dashboard-venditore/", views.dashboard_venditore, name="dashboard_venditore"),
    path("dashboard-meccanico/", views.dashboard_meccanico, name="dashboard_meccanico"),
]