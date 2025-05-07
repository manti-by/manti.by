# Manti.by


## About

Django custom blog engine for music and photo publishing.

[![Python3.12](https://img.shields.io/badge/Python-3.12-green)](https://www.python.org/downloads/release/python-3127/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/ambv/black)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/manti-by/Manti.by/master/LICENSE)

Author: Alexander Chaika <manti.by@gmail.com>

Source link: https://github.com/manti-by/manti.by

Requirements: Python 3.12, PostgreSQL 17, Redis


## Setup dev environment

1. Install base system packages (second line for production servers)

    ```bash
    sudo apt-get install -y \
        wget git-core python3-pip python3-dev postgresql libpq-dev
    ```

2. Install [Python 3.12](https://www.python.org/downloads/source/)
   
3. Install [Postgres server](https://www.postgresql.org/download/linux/ubuntu/)

4. Install [Redis server](https://redis.io/download)


## Build and run app in dev mode

1. Create virtual environment and install project dependencies

    ```shell
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    ```

2. Create user and database

    ```shell
    sudo su postgres && psql
    ```

    ```sql
    CREATE USER manti_by WITH PASSWORD 'manti_by' CREATEDB;
    CREATE DATABASE manti_by OWNER manti_by;
    ```

3. Create local config file (dev or prod environment)

    ```shell
    cp manti_by/settings/local.py.example manti_by/settings/local.py
    ```

4. Migrate, collect static files and create admin user

    ```shell
    python3 manage.py migrate
    python3 manage.py collectstatic --no-input
    python3 manage.py createsuperuser
    ```

5. Run local development server

    ```shell
    python3 manage.py runserver 127.0.0.1:8000
    ```


## Production setup

1. Install [Docker](https://docs.docker.com/install/)

2. Build and run app using Makefile

    ```shell
    make build
    docker compose up -d
    ```
