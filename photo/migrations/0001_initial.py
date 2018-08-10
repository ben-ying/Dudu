# Generated by Django 2.0.5 on 2018-08-10 16:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exif_image_width', models.IntegerField(blank=True, null=True, verbose_name='image width')),
                ('exif_image_height', models.IntegerField(blank=True, null=True, verbose_name='image height')),
                ('exif_make', models.CharField(blank=True, max_length=50, null=True, verbose_name='make')),
                ('exif_model', models.CharField(blank=True, max_length=100, null=True, verbose_name='model')),
                ('exif_lens_make', models.CharField(blank=True, max_length=50, null=True, verbose_name='lens make')),
                ('exif_lens_model', models.CharField(blank=True, max_length=100, null=True, verbose_name='lens model')),
                ('exif_version', models.CharField(blank=True, max_length=10, null=True, verbose_name='exif version')),
                ('exif_subject_location', models.CharField(blank=True, max_length=30, null=True, verbose_name='subject location')),
                ('exif_datetime', models.DateTimeField(blank=True, null=True, verbose_name='datetime')),
                ('exif_datetime_original', models.DateTimeField(blank=True, null=True, verbose_name='datetime original')),
                ('exif_datetime_digitized', models.DateTimeField(blank=True, null=True, verbose_name='datetime digitized')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('sha1sum', models.CharField(max_length=50, verbose_name='sha1sum')),
                ('category', models.IntegerField(default=0, verbose_name='category')),
                ('description', models.CharField(blank=True, max_length=1024, null=True, verbose_name='description')),
                ('pub_date', models.DateTimeField(auto_now_add=True, verbose_name='date published')),
                ('modify_date', models.DateTimeField(auto_now=True, verbose_name='date modified')),
            ],
        ),
    ]
