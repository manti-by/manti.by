FROM python:3.10-slim

RUN apt-get update && \
  apt-get -y install --no-install-recommends git-core

# Install python packages specified in requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.org --no-cache-dir --upgrade pip && \
    pip install --trusted-host pypi.org --no-cache-dir -r /tmp/requirements.txt

# Remove system packages after use
RUN apt-get autoremove -y --purge git-core && \
    apt-get clean -y

# Add base user
RUN useradd -m -s /bin/bash -d /home/manti manti && \
  mkdir -p /srv/manti/src/ /var/log/manti/ /var/lib/manti/static/ /var/lib/manti/content/ /var/lib/manti/data/ && \
  chown -R manti:manti /srv/manti/src/ /var/lib/manti/ /var/log/manti/

# Select user, set working directory and run server
USER manti
WORKDIR /srv/manti/src/
CMD python manage.py runserver