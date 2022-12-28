from django.db import models
from StaffManager.models import TeamLead_Register
from SuperAdmin.models import LeadCreate
from datetime import datetime
from Admins.models import Manager


# Create your models here.
class employee_Register(models.Model):     #Worker_Register
    # lead_ass = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    created_by = models.ForeignKey(TeamLead_Register, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    username = models.CharField(max_length=50)
    email =  models.EmailField(max_length=200)
    password = models.CharField(max_length=30)
    date = models.DateTimeField()
    
    
class TaskToEmployees(models.Model):
    lead_id = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    assign_by = models.ForeignKey(employee_Register, on_delete=models.CASCADE)
    created_by = models.ForeignKey(TeamLead_Register, on_delete=models.CASCADE)