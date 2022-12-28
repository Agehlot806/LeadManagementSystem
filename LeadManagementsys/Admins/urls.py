from django.urls import path
from . import views

urlpatterns = [

    path('manager/', views.SignUp),
    path('get_users/', views.Get_all_users),
    path('userdetails/<str:id>/', views.UserDetails, name="view_detail"),
    path('new_lead/', views.CreateLeads),
    path('get_all_lead/', views.get_all_lead),
    path('show_for_admin/<int:id>/', views.ShowLeadInfo, name='show_for_admin'),
    path('edit_by_admin/<int:id>/', views.EditLeadInfo, name='edit_by_admin'),
    path('delete_by_admin/<int:id>/', views.DeleteLeadInfo, name='delete_by_admin'),

    path('upload_file/', views.simple_upload),
    path('export_lead/', views.Export_xlsx),
    path('demofile/', views.Demo_xlsx),
    
    path('task-assign/', views.AssignLead, name="task"),
    path('task-assign/<int:pk>/', views.AssignLeadDelete, name="deltask"),

    path('call_logs_create/<int:id>/',views.CallLogs, name='call_log'),
    path('edit_loginfo/<int:id>/', views.Edit_callLog, name='edit_log'),
    path('delete_loginfo/<int:id>/', views.Delete_log, name='delete_log'),


    path('notes_create/<int:id>/',views.Notes_CallLogs, name='notes'),
    path('notes_edit/<int:id>/',views.Edit_Note, name='edit_notes'),
    
    

    path('', views.Admin),
    
]