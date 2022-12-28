from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.http import HttpResponse
from .models import *
from SuperAdmin.models import LeadCreate
from datetime import datetime
from tablib import Dataset
from django.http import HttpResponse
import xlwt
from django.core.paginator import Paginator
from django.core.mail import send_mail
import mysql.connector
from django import forms
from operator import itemgetter
from Admins.models import Manager
from StaffManager.models import TeamLead_Register
# from Teamleader.models import employee_Registers
from .models import taskAssign, LeadCreateByStaffManager
from Admins.models import TaskAssignToManager
from SuperAdmin.models import *



def hello(request):
    return HttpResponse('Welcome! Leader')


def Get_all_users(request):
    # user = Manager.objects.get(id=request.session['id'])
    user = Manager.objects.get(username=request.session['username'])
    print(user)
    my_users = TeamLead_Register.objects.filter(created_by_id=user)            
    print(my_users)
    return render(request, "leads/users.html", {'my_users':my_users})




def UserDetails(request, id):
    getData  = TeamLead_Register.objects.get(id=id)            
    return render(request, "leads/users_detail.html", {'getData':getData})

# def SignUp(request):
#     if request.method == 'POST':
#         name = request.POST['fname']
#         lname = request.POST['lname']
#         email = request.POST['email']
#         username = request.POST['username']
#         password = request.POST['pwd']
#         date = datetime.now()
        
#         if User.objects.filter(username=username).exists():
#                 messages.info(request, 'Username is already taken')
#                 return redirect('/leadsignup/')
#         elif User.objects.filter(email=email).exists():
#             messages.info(request, 'Email is already taken')
#             return redirect('/staffmanag/leadsignup/')
#         else:
#             uobj = User(first_name=name, last_name=lname, email=email, username=username, password=make_password(password), is_teamleader=True, date_joined=date)
#             uobj.save()
#             data= uobj.first_name
#             messages.success(request, f"{data} Your Account Has Been Created!")
#             send_mail(
#                     'Response Mail',
#                     f'Hi {name} \nWeclcome to Our Lead Management System Your Leader Account Has been Created successfully.\nUsername: {username}\nPassword: {password}',
#                     'techpanda.sr@gmail.com',
#                     [email],
#                     fail_silently=False,
#                 )
#             return redirect('/staffmanag/leadsignup/')
#     else:
#         return render(request, 'staffmanag/ledsignup.html')





def CreateLeads(request):
    my_source = LeadSource.objects.all()
    my_users = Manager.objects.all()
    # my_users = User.objects.all()
    if request.method == 'POST':
        fnm = request.POST['fname']
        mnm = request.POST['mname']
        lnm = request.POST['lname']
        gen = request.POST['gender']
        dob = request.POST['dob']
        email = request.POST['email']
        contact = request.POST['contact']
        alt_contact = request.POST['acontact']
        address = request.POST['address']
        per_address = request.POST['paddress']
        intr = request.POST['intrest']
        lesor = request.POST['leadsource']
        rem = request.POST['remark']
        # ass = request.POST['assigned_id']
        status = request.POST['status']
        date = datetime.now()
        user = Manager.objects.get(username=request.session['username'])
        created_by = user.id
        

        if LeadCreate.objects.filter(email=email).exists():
                messages.info(request, 'Email is already taken')
                return redirect('/staffmanag/new_lead/')
        else:
            ulead = LeadCreate(first_name=fnm,
                            middle_name=mnm,
                            last_name=lnm,
                            gender=gen,
                            birthday=dob,
                            email=email,
                            contact=contact,
                            alternat_no=alt_contact,
                            address=address,
                            permanent_address=per_address,
                            intrested=intr,
                            lead_sources=lesor,
                            remarks=rem,
                            # assigned=ass,
                            status=status,
                            date_create=date,
                            created_by_id=created_by)
            ulead.save()
            messages.success(request, "Lead Created Successfully")
            return redirect('/staffmanag/new_lead/')
    
    else:
        return render(request, "leads/new_lead_info.html", {'my_users': my_users,'my_source':my_source})



def get_all_lead(request):
    user = Manager.objects.get(username=request.session['username'])
    print(user)
    ServiceData = TaskAssignToManager.objects.filter(assign_by_id=user)
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
    return render(request, "leads/mylead.html",data)


# def get_all_lead(request):
#     print("Welcome")
#     user = Manager.objects.get(username=request.session['username'])
#     print(user)
#     ServiceData = LeadCreate.objects.filter(assigned=user.first_name).filter(assigned=user.last_name)
#     print(ServiceData)
#     # ServiceData = LeadCreate.objects.all()
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
#     return render(request, "leads/mylead.html",data)




def ShowLeadInfo(request, id):
    data = TaskAssignToManager.objects.get(id=id)
    print(data)
    return render(request, "leads/show_lead_info.html", {'data':data})


def EditLeadInfo(request, id):
    my_users = TeamLead_Register.objects.all()
    my_source = LeadSource.objects.all()
    # print(my_users.assigned_id)
    print(my_users)
    if request.method == 'POST':
        fnm = request.POST['fname']
        mnm = request.POST['mname']
        lnm = request.POST['lname']
        gen = request.POST['gender']
        dob = request.POST['dob']
        email = request.POST['email']
        contact = request.POST['contact']
        alt_contact = request.POST['acontact']
        address = request.POST['address']
        per_address = request.POST['paddress']
        intr = request.POST['intrest']
        lesor = request.POST['leadsource']
        rem = request.POST['remark']
        # ass = request.POST['assigned_id']
        status = request.POST['status']
        # created_by = request.session['id']
        date = datetime.now()
        # led_id = LeadCreate.objects.get(id=id)
        
        # uplead = LeadCreateByStaffManager.objects.filter(id=id)
        uplead = LeadCreate.objects.filter(id=id)
        
        uplead.update(first_name=fnm,
                            middle_name=mnm,
                            last_name=lnm,
                            gender=gen,
                            birthday=dob,
                            email=email,
                            contact=contact,
                            alternat_no=alt_contact,
                            address=address,
                            permanent_address=per_address,
                            intrested=intr,
                            lead_sources=lesor,
                            remarks=rem,
                            # assigned=ass,
                            status=status,
                            date_create=date,
                            # created_by_id=created_by
                            )
        messages.success(request, f"{fnm} Lead By Manager Updated Successfully")
        # return redirect('/staffmanag/edit_leadinfo//')
        return redirect(request.META.get('HTTP_REFERER', 'redirect_if_referer_not_found'))  
    else:
        # print("hi")
        # users = Manager.objects.get(id=request.session['id'])
        # print('this',users)
        # my_users = TeamLead_Register.objects.filter(created_by_id=users)
        # print("this is user",my_users)
        # mylead = LeadCreateByStaffManager.objects.get(id=id)    
        mylead = LeadCreate.objects.get(id=id)
        return render(request, "leads/lead_info_edit.html", {'mylead':mylead, 'my_users':my_users,'my_source':my_source})


def DeleteLeadInfo(request, id):
    # data = LeadCreateByStaffManager.objects.get(id=id)
    data = LeadCreate.objects.get(id=id)
    data.delete()
    messages.success(request, f"{data.remarks}, Lead Deleted Succsessfull")
    return redirect('/staffmanag/get_all_lead/')


# def simple_upload(request):
#     if request.method == "POST":
#         lead_resource = LeadResource()
#         dataset = Dataset()
#         new_lead = request.FILES['myfile']

#         if not new_lead.name.endswith('xlsx'):
#             messages.info(request, 'Wrong file must be xlsx format!!')
#             return render(request, 'leads/upload_csv.html')
            
        
        
#         imported_data = dataset.load(new_lead.read(),format='xlsx')
#         for data in imported_data:
#             print(data)
#             print('this',request.user.id)
#             value = LeadCreate(
#                 data[0],
#                 data[1],
#                 data[2],
#                 data[3],
#                 data[4],
#                 data[5],
#                 data[6],
#                 data[7],
#                 data[8],
#                 data[9],
#                 data[10],
#                 data[11],
#                 data[12],
#                 data[13],
#                 data[14],
#                 data[15]
                
#                 )
#             value.save()
#         messages.success(request, "File Uploaded Successfull...")
#     return render(request, "leads/upload_csv.html")


'''Function for Export X '''

def Export_xlsx(request):
    response = HttpResponse(content_type='application/ms-excel')   #– This tells browsers that the document is an MS-EXCEL file, instead of an HTML file.
    response['Content-Disposition']= 'attachment; filename="leads.xls"'  #This contains CSV filename and downloads files with that name.

    wb = xlwt.Workbook(encoding='utf-8')         # Creating a Workbook of encoding utf-8
    ws = wb.add_sheet('Leads')                 # Creating a Sheet named “Leads” and all the data will be written inside this sheet.

    # sheet header, first row
    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold= True

    columns = ['id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create']

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    #sheet body, remaining rows
    font_style =xlwt.XFStyle()
    user = User.objects.get(id=request.session['id'])
    rows = LeadCreateByStaffManager.objects.filter(assigned_id=user).values_list('id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create')
    for row in rows:
        row_num += 1
        for col_num in range(len(row)):
            ws.write(row_num, col_num, row[col_num], font_style)

    wb.save(response)
    return response


def Demo_xlsx(request):
    response = HttpResponse(content_type='application/ms-excel')   #– This tells browsers that the document is an MS-EXCEL file, instead of an HTML file.
    response['Content-Disposition']= 'attachment; filename="leads.xls"'  #This contains CSV filename and downloads files with that name.

    wb = xlwt.Workbook(encoding='utf-8')         # Creating a Workbook of encoding utf-8
    ws = wb.add_sheet('Leads')                 # Creating a Sheet named “Leads” and all the data will be written inside this sheet.

    # sheet header, first row
    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold= True

    columns = ['id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create']

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    #sheet body, remaining rows
    font_style =xlwt.XFStyle()

    
    wb.save(response)
    return response
        


"""
Code for lead creation Update Show Delete
"""


def LeadAdmin(request):
    # print(request.session['username'])
    user = Manager.objects.get(username=request.session['username'])
    print(user.id)
    user = user.id
    
    task = TaskAssignToManager.objects.filter(assign_by_id=user).count()
    # print(task)
    # user = Manager.objects.all()
    # for i in user:
    #     print(i.id)

    return render(request, "leads/dashboard.html", {'task':task})   
    # return HttpResponse("Welcome Admin")


def ManagerLeads(request):
    user = Manager.objects.get(id=request.session['id'])
    showld = LeadCreateByStaffManager.objects.filter(created_by=user)
    return render(request, "leads/mylead.html", {'showld':showld})





# Create Team Leader Account By Staff Manager

def TL_register(request):
    if request.method == "POST":
        name = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        username = request.POST['username']
        password = request.POST['pwd']
        user = Manager.objects.get(username=request.session['username'])
        created_by = user.id
        print('This is',created_by)

        emp = TeamLead_Register(first_name=name, last_name=lname,username=username,email=email,password=password,created_by_id=created_by,date_joined=datetime.now())
        emp.save()
        messages.success(request, f"{username}, Team Leader Account Has Been Created")
        return redirect('/staffmanag/register_emp/')
    else:
        return render(request, 'leads/signup.html')



# Login For Staff Manager Account

class FormLogin(forms.Form):
    username = forms.CharField(label=("Username"), required=True)
    password = forms.CharField(label=("Password"), widget=forms.PasswordInput, required=True)

def login_emp(request):
    username = None
    form_login = FormLogin()
    if request.method == 'GET':
        if 'action' in request.GET:
            action =  request.GET.get('action')
            if action =='logout':
                if request.session.has_key('username'):
                    request.session.flush()
                return redirect('/staffmanag/managelogin/')
            
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
            m = Manager.objects.get(username=request.POST['username'],
                                    password=request.POST['password'])
            if username.strip() == username and password.strip() == password:
                request.session['username'] = username
                # request.session['id'] = m.id
                # print(request.session['id'])
                return redirect('/staffmanag/')
                
            else:
                username = None
    
    return render(request, 'leads/login.html',{'form':form_login})
                        #    leads/login.html
                        
                        
                        
# def AssignLead(request):
#     lead = LeadCreate.objects.get(id=2)
#     get_ls = taskAssign.objects.filter(lead_id_id=lead)
#     # print(get_ls)
#     # for i in get_ls:
#     #     print(i.lead_id)
#     return render(request, "leads/task.html", {'get_ls':get_ls})



def AssignLead(request):
    if request.method == 'POST':
        lead_name = request.POST['lead_id']
        ass_name = request.POST['assigned_id']
        user = Manager.objects.get(username=request.session['username'])
        created_by = user.id
        print(created_by)
        creat = taskAssign(lead_id_id=lead_name, assign_by_id=ass_name, created_by_id=created_by)
        creat.save()
        messages.success(request, "Lead Assigned Successful")
        return redirect('/staffmanag/task-assign/')
    else:
        # currently loggedin user
        user = Manager.objects.get(username=request.session['username'])        
        # all related teamleader
        get_my_user = TeamLead_Register.objects.filter(created_by_id=user)        
        # show lead
        showld = TaskAssignToManager.objects.filter(assign_by_id=user)
        
        print('this is lead', showld)
        get_ass_leads = taskAssign.objects.filter(created_by_id=user)
        for i in get_ass_leads:
            print(i.assign_by.first_name)
        context={
            'get_ls':get_ass_leads,
            'showld': showld,
            'get_my_user':get_my_user
        }
        return render(request, "leads/task.html", context)
    
    
    
def AssignLeadDelete(request, id):
    lead = taskAssign.objects.get(id=id)
    lead.delete()
    messages.info(request, f"{lead.assign_by.first_name} {lead.assign_by.last_name}, Lead deleted successful")
    return redirect('/staffmanag/task-assign/')