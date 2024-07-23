FROM python:3.12-slim

# Add directories
RUN mkdir -p /srv/app/src/ /var/log/app/ /var/lib/app/static/ /var/lib/app/content/

# Add system user
RUN useradd -m -s /bin/bash -d /home/manti manti && \
    chown -R manti:manti /srv/app/src/ /var/lib/app/ /var/log/app/

# Install any needed packages specified in requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --trusted-host pypi.org --no-cache-dir --upgrade pip && \
    pip install --trusted-host pypi.org --no-cache-dir -r /tmp/requirements.txt

# Select user, set working directory and run server
USER manti
WORKDIR /srv/app/src/
CMD ["python", "manage.py", "runserver"]
