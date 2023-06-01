# Manti.by


## About

Django custom blog engine for music and photo publishing.

[![CircleCI](https://img.shields.io/github/actions/workflow/status/manti-by/manti.by/backend.yml?branch=master)](https://github.com/manti-by/manti.by/actions)
[![Docker](https://img.shields.io/docker/automated/mantiby/manti.by.svg)](https://hub.docker.com/r/mantiby/manti.by/)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/manti-by/Manti.by/master/LICENSE)

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/manti.by

Requirements: Python 3.11, PostgreSQL 15, Redis


## Setup dev environment

1. Install base system packages (second line for production servers)

    ```shell
    $ sudo apt-get install -y wget git-core \
         python3-pip python3-dev postgresql libpq-dev
    ```

2. Install [Python 3.11](https://www.python.org/downloads/source/)
   
3. Install [Postgres server](https://www.postgresql.org/download/linux/ubuntu/)

4. Install [Redis server](https://redis.io/download)


## Build and run app in dev mode

1. Create virtual environment and install project dependencies

    ```shell
    $ python3.11 -m venv --prompt="manti" .venv/
    $ source .venv/bin/activate
    $ pip install -r requirements.txt
    ```

2. Create user and database

    ```shell
    $ sudo su postgres && psql
    ```

    ```postgresql
    CREATE USER manti_by WITH PASSWORD 'manti_by' CREATEDB;
    CREATE DATABASE manti_by OWNER manti_by;
    ```

3. Create local config file (dev or prod environment)

    ```shell
    $ cp manti_by/settings/local.py.example manti_by/settings/local.py
    ```

4. Migrate, collect static files and create admin user

    ```shell
    $ ./manage.py migrate
    $ ./manage.py collectstatic --no-input
    $ ./manage.py createsuperuser
    ```

5. Run local development server

    ```shell
    $ ./manage.py runserver 127.0.0.1:8000
    ```


## Production setup

1. Install [Docker](https://docs.docker.com/install/)

2. Build and run app using Makefile

    ```shell
    $ make build
    $ docker compose up -d
    ```
