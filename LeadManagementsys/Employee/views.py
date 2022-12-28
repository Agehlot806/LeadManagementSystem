from django.shortcuts import render, redirect
from SuperAdmin.models import *
from django.core.paginator import Paginator
# from Teamleader.models import employee_Register
from django import forms
from Teamleader.models import employee_Register, TaskToEmployees
# Create your views here.

def home(request):
    user = employee_Register.objects.get(username=request.session['username'])
    # print(user)
    my_lead = TaskToEmployees.objects.filter(assign_by_id=user).count()          
    # print(my_lead)
    return render(request, "employeelog/dashboard.html", {'my_lead':my_lead})


# def get_all_lead(request):
#     # cobjs = LeadCreate.objects.all().order_by("id").reverse()
#     ServiceData = LeadCreate.objects.all()
#     paginator = Paginator(ServiceData, 6)
#     page_number = request.GET.get('page')
#     all_lead = paginator.get_page(page_number)
#     totalpage = all_lead.paginator.num_pages
#     # for i in all_lead:
#     #     print(i)
#     data = {
#         'all_lead':all_lead,
#         'lastpage':totalpage,
#         'totalPagelist':[n+1 for n in range(totalpage)]
#     }
#     return render(request, "employeelog/list_of_leads.html",data)


def get_all_lead(request):
    user = employee_Register.objects.get(username=request.session['username'])
    print(user)
    ServiceData = TaskToEmployees.objects.filter(assign_by_id=user)
    print(ServiceData)
    paginator = Paginator(ServiceData, 6)
    page_number = request.GET.get('page')
    all_lead = paginator.get_page(page_number)
    totalpage = all_lead.paginator.num_pages
    print(all_lead)
    data = {
        'all_lead':all_lead,
        'lastpage':totalpage,
        'totalPagelist':[n+1 for n in range(totalpage)]
    }
    return render(request, "employeelog/list_of_leads.html",data)



def ShowLeadInfo(request, id):
    data = LeadCreate.objects.get(id=id)
    return render(request, "employeelog/show_lead_info.html", {'data':data})





class FormLogin(forms.Form):
    username = forms.CharField(label=("Username"), required=True)
    password = forms.CharField(label=("Password"), widget=forms.PasswordInput, required=True)
    
    
    
# Login For Employee Account

def login_Eploy(request):
    username = None
    form_login = FormLogin()
    if request.method == 'GET':
        if 'action' in request.GET:
            action =  request.GET.get('action')
            if action =='logout':
                if request.session.has_key('username'):
                    request.session.flush()
                return redirect('/employees/managelogin/')
            
        if 'username' in request.session:
            username = request.session['username']
            print(request.session.get_expiry_age())    # session lifetime in seconds (from now)
            print(request.session.get_expiry_date())   # datetime.datetime object which represent the moment in time at which
            
    elif request.method == 'POST':
        form_login = FormLogin(request.POST)
        # print(form_login)
        if form_login.is_valid():
            # m = Manager.objects.get(username=request.POST['username'])
            # print('this',m.id)
            username = form_login.cleaned_data['username']
            password = form_login.cleaned_data['password']
            m = employee_Register.objects.get(username=request.POST['username'],
                                              password=request.POST['password'])
            if username.strip() == username and password.strip() == password:
                request.session['username'] = username
                request.session['id'] = m.id
                print(request.session['id'])
                return redirect('/employees/')
                
            else:
                username = None
    
    return render(request, 'employeelog/login.html',{'form':form_login})
                        #    leads/login.html

