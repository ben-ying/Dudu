dropdb myproject
createdb myproject
rm -rf /tools/migrations
python manage.py makemigrations tools
python manage.py migrate tools
python manage.py createsuperuser
