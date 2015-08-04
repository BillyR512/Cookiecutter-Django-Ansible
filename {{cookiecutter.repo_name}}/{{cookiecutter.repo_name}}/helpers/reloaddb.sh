# kill server if it's running
fuser -k 8000/tcp

# restart postgres to terminate any connections
sudo service postgresql restart

# drop the database
sudo -u postgres psql --command "DROP DATABASE {{ cookiecutter.database_name }};"

# create the database
sudo -u postgres psql --command "CREATE DATABASE {{ cookiecutter.database_name }} WITH OWNER {{ cookiecutter.database_user }} ENCODING = 'UTF8' LC_CTYPE = 'en_US.UTF-8' LC_COLLATE = 'en_US.UTF-8' template=template0"

# make any new migrations
# python manage.py makemigrations

# migrate new migrations
python manage.py migrate

# create superuser
echo "from django.contrib.auth.models import User; User.objects.create_superuser('{{cookiecutter.author_name}}', '{{cookiecutter.email}}', 'DjangoUser')" | python manage.py shell

# restart elasticsearch
sudo service elasticsearch restart

# give elasticsearch time to boot
sleep 15

# add custom fixtures here
# example: python manage.py loaddata core/fixtures/somedata.json

# rebuild search index
python manage.py rebuild_index --noinput

# restart all supervisor processes
sudo supervisorctl restart all

# make sure django tests out
python manage.py test
