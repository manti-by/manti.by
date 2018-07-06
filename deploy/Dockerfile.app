# Use an official python 3.6 image

FROM python:3.6


# Create required dirs

RUN mkdir -p /srv/manti.by/
RUN mkdir -p /etc/manti.by/
RUN mkdir -p /run/manti.by/
RUN mkdir -p /var/log/manti.by/


# Install any needed packages specified in requirements.txt

RUN apt-get update && apt-get install -y supervisor
RUN apt-get clean

COPY requirements.app.txt /etc/manti.by/requirements.txt
RUN pip3 install --trusted-host pypi.org --no-cache-dir -r /etc/manti.by/requirements.txt


# Setup supervisor

COPY docker/supervisor.app.conf /etc/manti.by/supervisor.conf
COPY docker/uwsgi.ini /etc/manti.by/uwsgi.ini
COPY docker/uwsgi_params /etc/manti.by/uwsgi_params
RUN ln -s /etc/manti.by/supervisor.conf /etc/supervisor/conf.d/manti.by.conf


# Set workdir and expose ports

WORKDIR /srv/manti.by/src/app/
EXPOSE 8888
EXPOSE 5555


# Fix file permissions

RUN chown -R www-data:www-data /srv/manti.by/
RUN chown -R www-data:www-data /run/manti.by/
RUN chown -R www-data:www-data /var/log/manti.by/


# Start app services

CMD supervisord -n