from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from dateutil.relativedelta import relativedelta

from .models import Photo
from myproject.settings import MEDIA_URL
from myproject.settings import MEDIA_ROOT
from myproject.settings import BIRTHDAY
from myproject.settings import SOURCE_PHOTO_FOLDER
from myproject.settings import PHOTO_DIR
from shutil import copyfile

import os
import PIL.Image
import PIL.ExifTags
import hashlib


def index(request):
    photos = Photo.objects.all()
    context = {
        'photos': photos,
    }

    return render(request, 'index.html', context)


def classification(request):
    '''
    for p in Photo.objects.all():
        p.delete()

    return HttpResponse("OK")
    '''
    folder = request.GET.get("folder", "")
    print("folder: " + folder)
    if not folder:
        return HttpResponse("Error")

    if not os.path.isdir(os.path.join(SOURCE_PHOTO_FOLDER, folder)):
        return HttpResponse("Dir not exists")

    n = 0
    for root, directories, files in os.walk(os.path.join(SOURCE_PHOTO_FOLDER, folder)):
        total = len(files)
        for file_name in files:
            n += 1
            print("detail", "========Executing " + str(n) + "/" + str(total) + "========")
            file_path = os.path.join(root, file_name)
            if file_path.lower().endswith("jpg") \
                    or file_path.lower().endswith("jpeg"): 
                save_image(file_path, file_name, folder)
            else:
                print("Error file format " + file_name.split(".")[-1])

    return HttpResponse("OK")

def save_image(file_path, file_name, folder):
    photo = Photo()
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
                    datetime = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime = datetime
                if k == "DateTimeOriginal":
                    datetime_original = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime_original = datetime_original
                    url = move_image(file_name, file_path, folder, datetime)
                    photo.url = url
                if k == "DateTimeDigitized":
                    datetime_digitized = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime_digitized = datetime_digitized
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

def move_image(file_name, file_path, folder, img_datetime):
    photo_dir = os.path.join(MEDIA_ROOT, PHOTO_DIR, folder)
    delta = relativedelta(datetime.strptime(
        img_datetime.split(" ")[0], '%Y-%m-%d'), 
        datetime.strptime(BIRTHDAY, '%Y-%m-%d'))

    if delta.years == 0:
        sub_dir = str(delta.months + 1) + "M"
    else:
        sub_dir = str(delta.years + 1) + "Y"

    img_dir = os.path.join(photo_dir, sub_dir)
    os.makedirs(img_dir, exist_ok=True)
    #os.rename(file_path, os.path.join(img_dir, file_name))
    copyfile(file_path, os.path.join(img_dir, file_name))

    return os.path.join(MEDIA_URL, PHOTO_DIR, folder, sub_dir, file_name)

