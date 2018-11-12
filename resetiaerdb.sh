rm -rf /iaer/migrations
python manage.py makemigrations iaer
python manage.py migrate
python manage.py createsuperuser
