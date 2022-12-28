from django.urls import path
from . import views

urlpatterns = [
    path('', views.TL_Dashboard),
    path('emplogin/', views.login_TL),
    path('register_user/', views.Employee_register),
    path('get_all_lead/', views.get_all_lead),
    path('task-assign/', views.AssignLead, name="task"),
    path('get_users/', views.GetEmployeeList),
    path('userdetails/<int:id>/', views.UserDetails, name="view_detail"),
    
    path('task-assign/<int:id>/', views.AssignLeadDelete, name="task_tl"),

]