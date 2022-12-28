from django.shortcuts import render, redirect
from django.http import HttpResponse
from Admins.models import *
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
import mysql.connector
from django import forms
from operator import itemgetter
from .models import employee_Register
from django.core.paginator import Paginator
from datetime import datetime
from StaffManager.models import TeamLead_Register
from StaffManager.models import taskAssign
from Teamleader.models import TaskToEmployees




def TL_Dashboard(request):
    user = TeamLead_Register.objects.get(username=request.session['username'])
    # print(user)
    task = taskAssign.objects.filter(assign_by_id=user).count()          
    # print(my_lead)
    return render(request, "emp/dashboard.html", {'task':task})   
    


def GetEmployeeList(request):
    # user = Manager.objects.get(id=request.session['id'])
    user = TeamLead_Register.objects.get(username=request.session['username'])
    print(user)
    my_users = employee_Register.objects.filter(created_by_id=user)            
    print(my_users)
    return render(request, "emp/users.html", {'my_users':my_users})


def UserDetails(request, id):
    getData  = employee_Register.objects.get(id=id)            
    return render(request, "emp/users_detail.html", {'getData':getData})


# Create Employee Account By Team Leader 

def Employee_register(request):
    if request.method == "POST":
        name = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        username = request.POST['username']
        password = request.POST['pwd']
        created_by = request.session['id']
        # print('This is',created_by)

        emp = employee_Register(first_name=name, last_name=lname,username=username,email=email,password=password,created_by_id=created_by,date=datetime.now())
        emp.save()
        messages.success(request, f"{username}, Employee Account Has Been Created")
        return redirect('/teamleader/register_user/')
    else:
        return render(request, 'emp/signup.html')



# Code for Team Leader Login System

class FormLogin(forms.Form):
    username = forms.CharField(label=("Username"), required=True)
    password = forms.CharField(label=("Password"), widget=forms.PasswordInput, required=True)

def login_TL(request):
    username = None
    form_login = FormLogin()
    if request.method == 'GET':
        if 'action' in request.GET:
            action =  request.GET.get('action')
            if action =='logout':
                if request.session.has_key('username'):
                    request.session.flush()
                return redirect('/teamleader/managelogin/')
            
        if 'username' in request.session:
            username = request.session['username']
            print(request.session.get_expiry_age())    # session lifetime in seconds (from now)
            print(request.session.get_expiry_date())   # datetime.datetime object which represent the moment in time at which
            
    elif request.method == 'POST':
        form_login = FormLogin(request.POST)
        print(form_login)
        if form_login.is_valid():
            # m = Manager.objects.get(username=request.POST['username'])
            # print('this',m.id)
            username = form_login.cleaned_data['username']
            password = form_login.cleaned_data['password']
            m = TeamLead_Register.objects.get(username=request.POST['username'],
                                              password=request.POST['password'])
            if username.strip() == username and password.strip() == password:
                request.session['username'] = username
                request.session['id'] = m.id
                print(request.session['id'])
                return redirect('/teamleader/')
                
            else:
                username = None
    
    return render(request, 'emp/login.html',{'form':form_login})
                        #    leads/login.html

       
def logout_call(request):
	logout(request)
	return redirect('/logout/')

    


def get_all_lead(request):
    my_users = TeamLead_Register.objects.get(id=request.session['id'])
    self_leads= taskAssign.objects.filter(assign_by_id=my_users)
    print(self_leads)
    for i in self_leads:
        print(i.lead_id.first_name)
    
    context = {
        'self_leads':self_leads,
        'my_users':my_users
    }
           
    return render(request, "emp/list_of_leads.html", context)
    
    





def AssignLead(request):
    if request.method == 'POST':
        lead_name = request.POST['lead_id']
        ass_name = request.POST['assigned_id']
        user = TeamLead_Register.objects.get(username=request.session['username'])
        created_by = user.id
        
        creat = TaskToEmployees(lead_id_id=lead_name, assign_by_id=ass_name, created_by_id=created_by)
        creat.save()
        messages.success(request, "Lead Assigned Successful")
        return redirect('/teamleader/task-assign/')
    else:
        user = TeamLead_Register.objects.get(username=request.session['username'])
        get_my_user = employee_Register.objects.filter(created_by_id=user)
        
        print(get_my_user)
        
        showld = taskAssign.objects.filter(assign_by_id=user)
        print('this is lead', showld)
        get_ass_leads = TaskToEmployees.objects.filter(created_by_id=user)
        context={
            'get_ls':get_ass_leads,
            'showld': showld,
            'get_my_user':get_my_user
        }
        return render(request, "emp/task.html", context)
    
    
    
def AssignLeadDelete(request, id):
    lead = TaskToEmployees.objects.get(id=id)
    lead.delete()
    messages.info(request, f"{lead.assign_by.first_name} {lead.assign_by.last_name}, Lead deleted successful")
    return redirect('/teamleader/task-assign/')