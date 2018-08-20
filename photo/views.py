import os
import PIL.Image
import PIL.ExifTags
import hashlib
import shutil

from django.shortcuts import render
from django.http import HttpResponse
from collections import defaultdict

from .models import Photo
from .models import User
from .models import THUMBNAIL_DIR
from myproject.settings import SOURCE_PHOTO_FOLDER
from myproject.settings import MEDIA_ROOT
from myproject.settings import PHOTO_DIR

def index(request):
    return HttpResponse("Not finished")

def user_gallery(request, pk):
    # todo modify
    return child_gallery(request, pk)

def child_gallery(request, pk):
    photo_dict = defaultdict(list)
    photos = Photo.objects.all().order_by('exif_datetime_original')

    for photo in photos:
        photo_dict[photo.sub_dir.replace("M", "个月").replace("Y", "岁")].append(photo)

    context = {
        'photo_dict': photo_dict.items(),
    }

    return render(request, 'child_gallery.html', context)


def reset(request):
    Photo.objects.all().delete()
    shutil.rmtree(os.path.join(MEDIA_ROOT, PHOTO_DIR))
    return HttpResponse("RESET")


def classification(request):
    '''
    for p in Photo.objects.all():
        p.delete()

    return HttpResponse("OK")
    '''
    username = request.GET.get("username", "")
    print("username: " + username)
    if not username or not User.objects.filter(auth_user__username = username):
        return HttpResponse("User not exists")

    if not os.path.isdir(os.path.join(SOURCE_PHOTO_FOLDER, username)):
        return HttpResponse("Dir not exists")

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

    return HttpResponse("OK")

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
                        photo.set_photo_directory(file_name, file_path, username)
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
