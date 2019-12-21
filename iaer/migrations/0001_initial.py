# Generated by Django 2.2.1 on 2019-12-21 15:08

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='About',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('version_name', models.CharField(max_length=20)),
                ('version_code', models.PositiveIntegerField()),
                ('apk', models.FileField(upload_to='apks/')),
                ('category', models.PositiveIntegerField(choices=[(1, 'Release'), (2, 'Debug'), (3, 'Test')], default=1)),
                ('comment', models.TextField(max_length=1024)),
                ('datetime', models.DateTimeField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('sequence', models.PositiveSmallIntegerField(default=0)),
                ('created', models.DateField(blank=True, editable=False, null=True)),
                ('modified', models.DateField(auto_now=True, null=True)),
            ],
            options={
                'ordering': ['sequence'],
            },
        ),
        migrations.CreateModel(
            name='Fund',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('monthly_money', models.PositiveSmallIntegerField(default=0)),
                ('yearly_money', models.PositiveIntegerField(default=0)),
                ('alternate_money', models.PositiveIntegerField(default=0)),
                ('created', models.DateField(blank=True, editable=False, null=True)),
                ('modified', models.DateField(auto_now=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_master_user', models.BooleanField(default=False)),
                ('phone', models.CharField(blank=True, max_length=30, null=True)),
                ('gender', models.PositiveSmallIntegerField(default=2)),
                ('profile', models.CharField(blank=True, max_length=200, null=True)),
                ('user_type', models.PositiveSmallIntegerField(default=0)),
                ('region', models.CharField(blank=True, max_length=100, null=True)),
                ('locale', models.CharField(blank=True, max_length=10, null=True)),
                ('whats_up', models.CharField(blank=True, max_length=200, null=True)),
                ('zone', models.CharField(blank=True, max_length=50, null=True)),
                ('birthday', models.DateTimeField(blank=True, null=True)),
                ('hobbies', models.TextField(blank=True, max_length=500, null=True)),
                ('highlighted', models.TextField(blank=True, null=True)),
                ('created', models.DateTimeField(blank=True, editable=False, null=True)),
                ('modified', models.DateTimeField(auto_now=True, null=True)),
                ('is_email_activate', models.BooleanField(default=False)),
                ('is_phone_activate', models.BooleanField(default=False)),
                ('auth_user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='uss', to=settings.AUTH_USER_MODEL)),
                ('fund', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='iaer.Fund')),
                ('slave_user', models.ManyToManyField(blank=True, related_name='_user_slave_user_+', to='iaer.User')),
            ],
        ),
        migrations.CreateModel(
            name='Verify',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email_verify_code', models.CharField(blank=True, max_length=10, null=True)),
                ('phone_verify_code', models.CharField(blank=True, max_length=10, null=True)),
                ('created', models.DateTimeField(auto_now=True, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='iaer.User')),
            ],
        ),
        migrations.CreateModel(
            name='Setting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('home_show_current', models.BooleanField(default=False)),
                ('home_show_this_month', models.BooleanField(default=False)),
                ('home_show_this_year', models.BooleanField(default=False)),
                ('monthly_fund', models.PositiveIntegerField(default=0)),
                ('yearly_fund', models.PositiveIntegerField(default=0)),
                ('created', models.DateField(blank=True, editable=False, null=True)),
                ('modified', models.DateField(auto_now=True, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='iaer.User')),
            ],
        ),
        migrations.CreateModel(
            name='RedEnvelope',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('money', models.CharField(blank=True, max_length=10, null=True)),
                ('money_type', models.IntegerField(default=0)),
                ('money_from', models.CharField(blank=True, max_length=100, null=True)),
                ('remark', models.CharField(max_length=100)),
                ('created', models.DateTimeField(blank=True, editable=False, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='iaer.User')),
            ],
            options={
                'ordering': ['-created'],
            },
        ),
        migrations.CreateModel(
            name='Iaer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('money', models.IntegerField()),
                ('category', models.CharField(default=0, max_length=30)),
                ('money_type', models.IntegerField(default=0)),
                ('remark', models.CharField(max_length=100)),
                ('created', models.DateTimeField(blank=True, null=True)),
                ('type', models.IntegerField(default=0)),
                ('chart_type', models.IntegerField(default=0)),
                ('date', models.DateField(blank=True, null=True)),
                ('format', models.CharField(blank=True, max_length=50, null=True)),
                ('datetime', models.DateTimeField(auto_now=True, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('timing', models.CharField(blank=True, max_length=100, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='iaer.User')),
            ],
            options={
                'ordering': ['-date', '-id'],
            },
        ),
    ]
