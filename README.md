M2 Micro CMS
============


About
-----

Django version of PHP Micro Framework M2.

Author: Alex Manti <manti.by@gmail.com>

Source link: https://github.com/manti-by/M2-Blog-Engine

Requirements:

    Ubuntu 14/16, Python, PostgreSQL, Memcache, Redis


Installation
-------------

1. Install environment (second line for staging servers):

        $ sudo apt-get install -y git python-pip python-dev python-six    
        $ sudo apt-get install -y nginx supervisor postgresql libpq-dev


2. Install [FFMpeg](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu) on the server


3. Install [Redis server](https://redis.io/download)


4. Install project dependencies:

        $ cd ../
        $ virtualenv --no-site-packages --prompt="manti-venv-" venv
        $ source venv/bin/activate
        $ sudo pip install -r src/requirements.txt


5. Create database, if necessary:

        $ sudo -u postgres bash -c "psql -c \"CREATE DATABASE manti;\""
        $ sudo -u postgres bash -c "psql -c \"CREATE USER manti WITH PASSWORD 'pa55word';\""
        $ sudo -u postgres bash -c "psql -c \"ALTER ROLE manti SET client_encoding TO 'utf8';\""
        $ sudo -u postgres bash -c "psql -c \"ALTER ROLE manti SET default_transaction_isolation TO 'read committed';\""
        $ sudo -u postgres bash -c "psql -c \"ALTER ROLE manti SET timezone TO 'UTC';\""
        $ sudo -u postgres bash -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE manti TO manti;\""


6. Create local config file:

        $ cp src/app/core/settings/local.py.example src/app/core/settings/local.py


7. Migrate, collect static files and create admin user:

        $ cd src/app/
        $ ./manage.py migrate
        $ ./manage.py collectstatic --no-input
        $ ./manage.py createsuperuser


8. Run local dev server or link configs on staging server and restart:

        $ ./manage.py runserver 0.0.0.0:8000
        $ sudo ln -s ./deploy/confs/nginx.conf /etc/nginx/sites-available/default.conf
        $ sudo ln -s ./deploy/confs/supervisor.conf /etc/supervisor/conf.d/default.conf
        $ sudo service nginx restart
        $ sudo supervisorctl restart core
    

9. Run celery/redis server

        $ ./manage.py celeryd -E
        $ ./manage.py celerycam