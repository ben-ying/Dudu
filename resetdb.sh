rm -rf /photo/migrations
python manage.py makemigrations photo
python manage.py migrate
python manage.py createsuperuser
