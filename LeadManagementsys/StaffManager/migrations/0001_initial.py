# Generated by Django 4.1.3 on 2022-12-27 16:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('SuperAdmin', '0001_initial'),
        ('Admins', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamLead_Register',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('username', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=200)),
                ('password', models.CharField(max_length=30)),
                ('date_joined', models.DateTimeField()),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Admins.manager')),
            ],
        ),
        migrations.CreateModel(
            name='taskAssign',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('assign_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='StaffManager.teamlead_register')),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Admins.manager')),
                ('lead_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SuperAdmin.leadcreate')),
            ],
        ),
        migrations.CreateModel(
            name='LeadCreateByStaffManager',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=150)),
                ('middle_name', models.CharField(max_length=150)),
                ('last_name', models.CharField(max_length=150)),
                ('gender', models.CharField(max_length=150)),
                ('birthday', models.DateField(max_length=150)),
                ('email', models.EmailField(max_length=150)),
                ('contact', models.CharField(max_length=12)),
                ('alternat_no', models.CharField(max_length=12)),
                ('address', models.CharField(max_length=300)),
                ('permanent_address', models.CharField(max_length=500)),
                ('intrested', models.CharField(max_length=150)),
                ('lead_sources', models.CharField(max_length=150)),
                ('remarks', models.TextField(max_length=500)),
                ('status', models.CharField(max_length=150)),
                ('date_create', models.DateField()),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Admins.manager')),
            ],
        ),
    ]
