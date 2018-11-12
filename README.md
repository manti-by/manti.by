Manti.by
========


About
-----

Django custom blog engine for music and photo publishing.

[![CircleCI](https://circleci.com/gh/manti-by/Manti.by.svg?style=svg&circle-token=251a247a58b266c9154253facca70ce0d8b6e169)](https://circleci.com/gh/manti-by/Manti.by)
[![Docker](https://img.shields.io/docker/automated/mantiby/manti.by.svg)](https://hub.docker.com/r/mantiby/manti.by/)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/manti-by/Manti.by/master/LICENSE)

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/Manti.by

Requirements:

    Ubuntu 18, Python 3.5, PostgreSQL 10, Memcache, Redis


Setup dev environment
---------------------

1. Install base system packages (second line for production servers)

        $ sudo apt-get install -y git-core python3-pip python3-dev python3-six postgresql libpq-dev \
            wget nginx supervisor


2. Get [FFMpeg](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu), compile and install

        $ sudo apt install -y autoconf automake build-essential cmake libtool libass-dev \
            libfreetype6-dev libmp3lame-dev libtheora-dev libvorbis-dev pkg-config \
            texinfo zlib1g-dev yasm
        
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
        $ make -j2 && make install


3. Install [Redis server](https://redis.io/download)


Build and run app in dev mode
-----------------------------

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

        $ sudo -u postgres psql -d manti < deploy/database/manti.sql


4. Create local config file (dev or prod environment)

        $ cp app/core/settings/local.py.example app/core/settings/local.py


5. Migrate, collect static files and create admin user

        $ cd src/app/
        $ ./manage.py migrate
        $ ./manage.py collectstatic --no-input
        $ ./manage.py createsuperuser


6. Run local development server

        $ ./manage.py runserver 0.0.0.0:8000


Production setup
----------------

1. Install [Docker](https://docs.docker.com/install/)

2. Build and run app using Makefile

        $ make start
