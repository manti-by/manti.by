Manti.by
========


About
-----

Django version of PHP micro framework M2, custom blog engine for music and photo publishing.

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/M2-Blog-Engine

Requirements:

    Ubuntu 14/16, Python 3+, PostgreSQL, Memcache, Redis


Setup environment
-----------------

1. Install base system packages (second line for production servers)

        $ sudo apt-get install -y git python3-pip python3-dev python3-six postgresql libpq-dev
        $ sudo apt-get install -y nginx supervisor 


2. Get [FFMpeg](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu), compile and install

        $ export PATH="$HOME/bin:$PATH" && export PKG_CONFIG_PATH="$HOME/usr/ffmpeg/build/lib/pkgconfig"
        $ ./configure \
              --prefix="$HOME/usr/ffmpeg/build" \
              --pkg-config-flags="--static" \
              --extra-cflags="-I$HOME/usr/ffmpeg/build/include" \
              --extra-ldflags="-L$HOME/usr/ffmpeg/build/lib" \
              --extra-libs="-lpthread -lm" \
              --bindir="$HOME/bin" \
              --enable-gpl \
              --enable-libass \
              --enable-libfreetype \
              --enable-libmp3lame \
              --enable-libtheora \
              --enable-libvorbis \
              --enable-nonfree
        $ make && make install


3. Install [Redis server](https://redis.io/download)


Install application
-------------------

1. Create virtual environment and install project dependencies

        $ cd ../
        $ virtualenv -p python3 --no-site-packages --prompt="manti-" venv
        $ . venv/bin/activate
        $ pip install -r src/deploy/requirements.txt


2. Create database and appropriate user

        $ sudo -u postgres psql -c "CREATE DATABASE manti;"
        $ sudo -u postgres psql -c "CREATE USER manti WITH PASSWORD 'pa55word';"
        $ sudo -u postgres psql -c "ALTER ROLE manti SET client_encoding TO 'utf8';"
        $ sudo -u postgres psql -c "ALTER ROLE manti SET default_transaction_isolation TO 'read committed';"
        $ sudo -u postgres psql -c "ALTER ROLE manti SET timezone TO 'UTC';"
        $ sudo -u postgres psql -c "ALTER ROLE manti CREATEDB;"
        $ sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE manti TO manti;"


3. Deploy data to database

        $ sudo -u postgres psql -d manti < deploy/manti.sql


4. Create local config file (dev or prod environment)

        $ cp app/core/settings/local.py.dev app/core/settings/local.py


5. Migrate, collect static files and create admin user

        $ cd src/app/
        $ ./manage.py migrate
        $ ./manage.py collectstatic --no-input
        $ ./manage.py createsuperuser


6. Run local dev server or link configs on prod server and restart

        $ ./manage.py runserver 0.0.0.0:8000
        
        $ sudo ln -s ./deploy/confs/nginx.conf /etc/nginx/sites-enabled/default.conf
        $ sudo ln -s ./deploy/confs/supervisor.conf /etc/supervisor/conf.d/default.conf
        $ sudo service nginx restart
        $ sudo supervisorctl restart manti:


Docker setup
------------

1. Install [Docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)

2. Build app image and run

        $ cd deploy/ 
        $ docker build -f Dockerfile -t mantiby/manti.by:latest .
        $ docker-compose up