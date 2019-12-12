#!/usr/bin/env bash
rm -rf iaer/migrations/00*
rm -rf photo/migrations/00*
#rm -rf db.sqlite3
dropdb myproject
createdb myproject
# Todo: psql -U pi myproject < dump.sql
python manage.py migrate
python manage.py makemigrations iaer
python manage.py makemigrations photo
#python manage.py sqlmigrate iaer 0001
python manage.py migrate
python manage.py createsuperuser --username=admin --email=benying1988@gmail.com
