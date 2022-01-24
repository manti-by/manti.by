Manti.by
========


About
-----

Django custom blog engine for music and photo publishing.

[![CircleCI](https://img.shields.io/github/workflow/status/manti-by/manti.by/Backend/develop)](https://github.com/manti-by/manti.by/actions)
[![Docker](https://img.shields.io/docker/automated/mantiby/manti.by.svg)](https://hub.docker.com/r/mantiby/manti.by/)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/manti-by/Manti.by/master/LICENSE)

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/manti.by

Requirements:

    Python 3.9, PostgreSQL 12, Redis


Setup dev environment
---------------------

1. Install base system packages (second line for production servers)

        $ sudo apt-get install -y wget git-core python3-pip python3-dev postgresql libpq-dev


2. Get [FFMpeg](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu), compile and install

        $ sudo apt install -y autoconf automake build-essential cmake git-core libtool \
            libass-dev libfreetype6-dev libmp3lame-dev libtheora-dev libvorbis-dev \
            pkg-config texinfo zlib1g-dev yasm
            
        $ mkdir -p $HOME/usr/ffmpeg/ && \
            wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
            tar xjvf ffmpeg-snapshot.tar.bz2 -C $HOME/usr/ffmpeg/
        
        $ export PATH="$HOME/bin:$PATH" && export PKG_CONFIG_PATH="$HOME/usr/ffmpeg/build/lib/pkgconfig"
        $ ./configure \
            --prefix="$HOME/usr/ffmpeg/build" \
            --pkg-config-flags="--static" \
            --extra-cflags="-I$HOME/usr/ffmpeg/build/include" \
            --extra-ldflags="-L$HOME/usr/ffmpeg/build/lib" \
            --extra-libs="-lpthread -lm" \
            --bindir="$HOME/bin" \
            --enable-libmp3lame \
            --enable-libtheora \
            --enable-libvorbis \
            --enable-nonfree
        $ make -j4 && make install

3. Install [Python 3.9](https://www.python.org/downloads/source/)
   
4. Install [Postgres server](https://www.postgresql.org/download/linux/ubuntu/)

5. Install [Redis server](https://redis.io/download)


Build and run app in dev mode
-----------------------------

1. Create virtual environment and install project dependencies

        $ python3.9 -m venv --prompt="mnt" .venv/
        $ source ../venv/bin/activate
        $ pip install -r requirements/dev.txt


2. Create user and database

        $ sudo su postgres && psql
        # CREATE USER manti_by WITH PASSWORD 'manti_by' CREATEDB;

        $ psql -h localhost -U manti_by
        # CREATE DATABASE manti_by;


3. Create local config file (dev or prod environment)

        $ cp manti_by/settings/local.py.example manti_by/settings/local.py


4. Migrate, collect static files and create admin user

        $ ./manage.py migrate
        $ ./manage.py collectstatic --no-input
        $ ./manage.py createsuperuser


5. Run local development server

        $ ./manage.py runserver 127.0.0.1:8000


Production setup
----------------

1. Install [Docker](https://docs.docker.com/install/)

2. Build and run app using Makefile

        $ make build
        $ docker-compose up -d
