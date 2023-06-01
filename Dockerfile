FROM python:3.11-alpine

COPY requirements.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.org --no-cache-dir --upgrade pip && \
    pip install --trusted-host pypi.org --no-cache-dir -r /tmp/requirements.txt

RUN mkdir -p /srv/app/src/ /var/log/app/ /var/lib/app/static/ /var/lib/app/content/

WORKDIR /srv/app/src/
CMD python manage.py runserver