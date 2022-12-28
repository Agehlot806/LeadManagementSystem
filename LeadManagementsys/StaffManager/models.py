from django.db import models
from django.contrib.auth.models import User
from SuperAdmin.models import LeadCreate

from Admins.models import Manager
from datetime import *

# Create your models here.
class TeamLead_Register(models.Model):
    # lead_ass = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    created_by = models.ForeignKey(Manager, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    username = models.CharField(max_length=50)
    email =  models.EmailField(max_length=200)
    password = models.CharField(max_length=30)
    date_joined = models.DateTimeField()
    
    
class LeadCreateByStaffManager(models.Model):
    
    first_name = models.CharField(max_length=150)
    middle_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    gender = models.CharField(max_length=150)
    birthday =  models.DateField(max_length=150)
    email = models.EmailField(max_length=150)
    contact = models.CharField(max_length=12)
    alternat_no = models.CharField(max_length=12)
    address = models.CharField(max_length=300)
    permanent_address = models.CharField(max_length=500)
    intrested =  models.CharField(max_length=150)
    lead_sources = models.CharField(max_length=150)
    remarks =  models.TextField(max_length=500)
    status =  models.CharField(max_length=150)
    date_create = models.DateField()
    created_by = models.ForeignKey(Manager, on_delete=models.CASCADE)


    def __str__(self):
        return self.first_name

    
    
class taskAssign(models.Model):
    lead_id = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    assign_by = models.ForeignKey(TeamLead_Register, on_delete=models.CASCADE)
    created_by = models.ForeignKey(Manager, on_delete=models.CASCADE)