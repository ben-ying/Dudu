#!/usr/bin/env bash
rm -rf iaer/migrations/00*
#rm -rf db.sqlite3
dropdb myproject
createdb myproject
python manage.py migrate
python manage.py makemigrations iaer
python manage.py sqlmigrate iaer 0001
python manage.py migrate
python manage.py createsuperuser --username=admin --email=benying1988@gmail.com
