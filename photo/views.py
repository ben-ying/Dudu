import os
import PIL.Image
import PIL.ExifTags
import hashlib
import shutil
import photo
import pdb

from django.contrib import messages
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic.edit import DeleteView
from django.views.generic.dates import YearArchiveView
from django.views.generic.dates import MonthArchiveView
from collections import defaultdict
from collections import OrderedDict

from .models.photo_model import Photo
from .models.photo_model import Gallery
from .models.photo_model import THUMBNAIL_DIR
from .models.user_model import User
from myproject.settings import SOURCE_PHOTO_FOLDER
from myproject.settings import MEDIA_ROOT
from myproject.settings import MEDIA_URL
from myproject.settings import PHOTO_APP_MEDIA_ROOT


def index(request):
    return redirect('photo:users')


class UserListView(ListView):
    model = User
    template_name = 'users.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['galleries'] = Gallery.objects.all()

        return context


class GalleryView(ListView):
    model = Photo
    template_name = 'gallery.html'

    def get_queryset(self):
        return Photo.objects.filter(galleries__title = self.kwargs['title'])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = self.kwargs['title']
        context['other_photos'] = Photo.objects.exclude(galleries__title = self.kwargs['title'])

        return context
    
    def post(self, request, *args, **kwargs):
        photo_ids = request.POST.get('selected_images')
        gallery_title = self.kwargs['title']
        gallery = Gallery.objects.get(title = gallery_title)

        for photo in self.get_queryset():
            photo.galleries.remove(gallery)
            photo.save()

        for photo_id in photo_ids.split(','):
            photo = Photo.objects.get(pk = photo_id)
            photo.galleries.add(gallery)
            photo.save()

        return redirect('photo:gallery', title = gallery_title)


class UserGalleryView(ListView):
    template_name = 'user_gallery.html'
    
    def get_queryset(self):
        return Photo.objects.filter(user__id = self.kwargs['pk']).order_by('duration')

    def get_context_data(self, **kwargs):
        photo_dict = defaultdict(list)
        context = super().get_context_data(**kwargs)

        for photo in context['photo_list']:
            photo_dict[photo.get_sub_dir_description()].append(photo)

        # sorted by key, default by alphabet (i.e. 8M > 10M)
        context['photo_dict'] = sorted(photo_dict.items(), key=lambda s:s[1][0].duration)
        context['title'] = User.objects.get(id = self.kwargs['pk']).auth_user.username

        return context


class GalleryYearArchiveView(YearArchiveView):
    model = Photo
    template_name = 'date_archive_gallery.html'
    date_field = 'exif_datetime_original'
    make_object_list = True
    allow_future = True

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = str(self.kwargs['year']) + '(' + \
                User.objects.get(id = self.kwargs['pk']).auth_user.username + ')'

        return context


class GalleryMonthArchiveView(MonthArchiveView):
    model = Photo
    template_name = 'date_archive_gallery.html'
    date_field = 'exif_datetime_original'
    make_object_list = True
    allow_future = True

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = str(self.kwargs['year']) + \
                '.'+ str(self.kwargs['month']) + '(' + \
                User.objects.get(id = self.kwargs['pk']).auth_user.username + ')'

        return context


def reset(request, user_id):
    if not User.objects.filter(id = user_id):
        return HttpResponse("User not exists")

    for root, directories, files in os.walk(PHOTO_APP_MEDIA_ROOT):
        if os.path.basename(root) != THUMBNAIL_DIR:
            for f in files:
                print("from: " + os.path.join(root, f) + ", to: " \
                        + os.path.join(SOURCE_PHOTO_FOLDER, os.path.basename(os.path.dirname(root)), f))
                os.rename(os.path.join(root, f), \
                        os.path.join(SOURCE_PHOTO_FOLDER, os.path.basename(os.path.dirname(root)), f))

    Photo.objects.filter(user__id = user_id).delete()
    user_photo_dir = os.path.join(PHOTO_APP_MEDIA_ROOT, User.objects.get(id = user_id).auth_user.username)

    if not os.path.isdir(user_photo_dir):
        message = '已经重置过了'
    else:
        shutil.rmtree(user_photo_dir)
        message = '重置已完成'

    messages.add_message(request, messages.INFO, message)

    return redirect('photo:users')


def classification(request, user_id):
    if not User.objects.filter(id = user_id):
        return HttpResponse("User not exists")

    username = User.objects.get(id = user_id).auth_user.username

    if not os.path.isdir(os.path.join(SOURCE_PHOTO_FOLDER, username)):
        message = '用户图片目录不存在'
    else:
        n = 0
        for root, directories, files in os.walk(os.path.join(SOURCE_PHOTO_FOLDER, username)):
            total = len(files)
            for file_name in files:
                n += 1
                print("detail", "========Executing " + str(n) + "/" + str(total) + "========")
                file_path = os.path.join(root, file_name)
                if file_path.lower().endswith("jpg") \
                        or file_path.lower().endswith("jpeg"): 
                    save_image(file_path, file_name, username)
                else:
                    print("Error file format " + file_name.split(".")[-1])

    message = '初始化已完成'
    messages.add_message(request, messages.INFO, message)

    return redirect('photo:users')


def save_image(file_path, file_name, username):
    user = User.objects.get(auth_user__username = username)
    photo = Photo()
    photo.user = user
    photo.name = file_name
    hasher = hashlib.sha1()
    with open(file_path, 'rb') as afile:
        buf = afile.read()
        hasher.update(buf)
        photo.sha1sum = hasher.hexdigest()
        photo.size = os.path.getsize(file_path)

    if not Photo.objects.filter(sha1sum = photo.sha1sum):
        img = PIL.Image.open(file_path)
        for key_number, v in img._getexif().items():
            if key_number in PIL.ExifTags.TAGS:
                # rstrip fix this error:
                # A string literal cannot contain NUL (0x00) characters
                try:
                    v = str(v).rstrip(' \t\r\n\0')
                    k = PIL.ExifTags.TAGS[key_number]
                    if k == "ExifImageWidth":
                        photo.exif_image_width = v
                    if k == "ExifImageHeight":
                        photo.exif_image_height = v
                    if k == "Make":
                        photo.exif_make = v
                    if k == "Model":
                        photo.exif_model = v
                    if k == "LensMake":
                        photo.exif_lens_make = v
                    if k == "LensModel":
                        photo.exif_lens_model = v
                    if k == "ExifVersion":
                        photo.exif_version = v
                    if k == "SubjectLocation":
                        photo.exif_subject_location = v
                    if k == "DateTime":
                        datetime = v.split(" ")[0].replace(":", "-")
                        photo.exif_datetime = datetime
                    if k == "DateTimeOriginal":
                        datetime_original = v.split(" ")[0].replace(":", "-")
                        photo.exif_datetime_original = datetime_original
                        photo.classification(file_name, file_path)
                    if k == "DateTimeDigitized":
                        datetime_digitized = v.split(" ")[0].replace(":", "-")
                        photo.exif_datetime_digitized = datetime_digitized
                except Exception as e:
                    print("------------------Error----------------------" + str(e))
            else:
                print("Error key number: " + str(key_number))
        
        photo.save()
    else:
        print("File already Exists")
'''
    photos = Photo.objects.all()
    for photo in photos:
        if not photo.exif_datetime:
            print("-------------------no datetime----------------")
        elif not photo.exif_datetime_digitized:
            print("-------------------no datetime digitized----------------")
        elif not photo.exif_datetime_original:
            print("-------------------no datetime original----------------")
        elif photo.exif_datetime != photo.exif_datetime_digitized:
            print("-------------------datetime vs digitized----------------")
            print(str(photo.exif_datetime) + ", " + str(photo.exif_datetime_digitized) + ", " + str(photo.exif_datetime_original))
        elif photo.exif_datetime != photo.exif_datetime_original:
            print("-------------------datetime vs original----------------")
        elif photo.exif_datetime_original != photo.exif_datetime_digitized:
            print("-------------------original vs digitized----------------")
        else:
            print("----------------------OK--------------------------")
'''
