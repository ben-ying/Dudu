from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from dateutil.relativedelta import relativedelta

from .models import Photo
from myproject.settings import MEDIA_ROOT
from myproject.settings import BIRTHDAY
from myproject.settings import SOURCE_PHOTO_FOLDER
from myproject.settings import PHOTO_DIR
from myproject.settings import USER_DIR

import os
import PIL.Image
import PIL.ExifTags
import hashlib

def index(request):
    return render(request, 'index.html')

def classification(request):
    if not os.path.isdir(SOURCE_PHOTO_FOLDER):
        return HttpResponse("Dir not exists")

    n = 0
    for root, directories, files in os.walk(SOURCE_PHOTO_FOLDER):
        total = len(files)
        for file_name in files:
            n += 1
            print("detail", "========Executing " + str(n) + "/" + str(total) + "========")
            file_path = os.path.join(root, file_name)
            if file_path.lower().endswith("jpg") \
                    or file_path.lower().endswith("jpeg"): 
                saveImage(file_path, file_name)
            else:
                print("Error file format " + file_name.split(".")[-1])

    return HttpResponse("OK")

def saveImage(file_path, file_name):
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
                    photo.exif_subject_location = str(v)
                if k == "DateTime":
                    datetime = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime = datetime
                    moveImage(file_name, file_path, datetime)
                if k == "DateTimeOriginal":
                    datetime_original = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime_original = datetime_original
                if k == "DateTimeDigitized":
                    datetime_digitized = v.split(" ")[0].replace(":", "-") \
                            + " " + v.split(" ")[1]
                    photo.exif_datetime_digitized = datetime_digitized
            else:
                print("Error key number")
        
        photo.save()
    else:
        print("File already Exists")


def moveImage(file_name, file_path, img_datetime):
    photo_dir = os.path.join(MEDIA_ROOT, PHOTO_DIR, USER_DIR)
    delta = relativedelta(datetime.strptime(
        img_datetime.split(" ")[0], '%Y-%m-%d'), 
        datetime.strptime(BIRTHDAY, '%Y-%m-%d'))

    if delta.years == 0:
        img_dir = os.path.join(photo_dir, str(delta.months + 1) + "M")
    else:
        img_dir = os.path.join(photo_dir, str(delta.years + 1) + "Y")

    os.makedirs(img_dir, exist_ok=True)
    os.rename(file_path, os.path.join(img_dir, file_name))

