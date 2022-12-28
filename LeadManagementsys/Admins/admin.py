from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from SuperAdmin.models import LeadCreate
from .models import Manager


@admin.register(LeadCreate)
class LeadCreate_resource(ImportExportModelAdmin):
    list_display = ('first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'address', 'intrested','lead_sources','remarks','status','date_create','created_by_id')



admin.site.register(Manager)