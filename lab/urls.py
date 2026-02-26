from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('research/', views.research, name='research'),
    path('events/', views.events, name='events'),
    path('events/<slug:slug>/', views.event_detail, name='event_detail'), # ADD THIS LINE
    path('news/', views.news_list, name='news_list'),
    path('news/<slug:slug>/', views.news_detail, name='news_detail'),
    path('opportunities/', views.opportunities, name='opportunities'),
    path('contact/', views.contact_view, name='contact'),
    path('publications/', views.publications_view, name='publications'),
    path('team/', views.team_view, name='team'),
]