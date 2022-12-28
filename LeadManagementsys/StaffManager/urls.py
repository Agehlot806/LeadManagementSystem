from django.urls import path
from . import views

urlpatterns = [    
    path('', views.LeadAdmin),
    path('register_emp/', views.TL_register),
    path('myLeads/', views.get_all_lead),
    path('new_lead/', views.CreateLeads),
    
    path('get_users/', views.Get_all_users),
    path('userdetails/<int:id>/', views.UserDetails, name="view_details"),
    
    path('managelogin/', views.login_emp),
    path('export_lead/', views.Export_xlsx),
    path('showinfo/<int:id>/', views.ShowLeadInfo, name="show_for_manager"),

    path('edit_leadinfo/<int:id>/', views.EditLeadInfo, name='edit_by_manager'),
    
    path('delete_leadinfo/<int:id>/', views.DeleteLeadInfo, name='delete_by_manager'),
    
    path('task-assign/', views.AssignLead, name="task"),
    path('task-assign/<int:id>/', views.AssignLeadDelete, name="task_del"),

]