from django.db import models
from django.contrib.auth.models import User
from SuperAdmin.models import LeadCreate
from datetime import datetime
import uuid

# Create your models here.
class Manager(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    # lead_ass = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    username = models.CharField(max_length=50)
    email =  models.EmailField(max_length=200)
    password = models.CharField(max_length=30)
    # date_joined = models.DateTimeField(blank=True)
    
    def __str__(self):
        return self.username
    
    
class TaskAssignToManager(models.Model):
    lead_id = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    assign_by = models.ForeignKey(Manager, on_delete=models.CASCADE)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    
