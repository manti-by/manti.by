# Use an official ubuntu image

FROM ubuntu:16.04


# Create required dirs

RUN mkdir -p /srv/manti.by/src/
RUN mkdir -p /srv/manti.by/static/
RUN mkdir -p /srv/manti.by/content/
RUN mkdir -p /var/log/manti.by/
RUN mkdir -p /run/manti.by/


# Install any needed packages specified in requirements.txt

RUN apt-get update && apt-get install -y software-properties-common apt-utils \
    build-essential git python3 python3-dev python3-pip nginx supervisor

RUN pip3 install pip --upgrade
RUN pip3 install wheel

COPY ./deploy/requirements.txt /etc/manti.by/requirements.txt
RUN pip3 install --trusted-host pypi.org -r /etc/manti.by/requirements.txt


# Setup supervisor and nginx

COPY ./deploy/confs/supervisor.docker.conf /etc/manti.by/supervisor.conf
COPY ./deploy/confs/uwsgi.docker.ini /etc/manti.by/uwsgi.ini
COPY ./deploy/confs/uwsgi_params /etc/manti.by/uwsgi_params
COPY ./deploy/confs/nginx.docker.conf /etc/manti.by/nginx.conf

RUN ln -s /etc/manti.by/supervisor.conf /etc/supervisor/conf.d/manti.by.conf
RUN ln -s /etc/manti.by/nginx.conf /etc/nginx/sites-enabled/manti.by.conf
RUN rm /etc/nginx/sites-enabled/default


# Expose port 80 and set workir path

WORKDIR /srv/manti.by/src/
EXPOSE 80


# Start app services

CMD service supervisor start && \
    service nginx start && \
    /bin/bash
