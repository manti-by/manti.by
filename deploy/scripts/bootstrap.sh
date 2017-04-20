#!/bin/bash
TARGET=${1:-local}

header () {
    echo -e "\e[96m\e[1m$1\e[0m"
}

header "Read the config"
source ./config.sh

header "Updating system"
sudo apt-get update && sudo apt-get upgrade -y

header "Install required libraries"
sudo apt-get install -y git python-pip python-dev python-six postgresql libpq-dev
if [ "$TARGET" == "remote" ]; then
    sudo apt-get install -y nginx supervisor memcached
fi

header "Install python packages"
if [ "$TARGET" == "local" ]; then
    virtualenv --no-site-packages --prompt="$PROJECT_NAME-venv-" $LOCAL_PATH/venv
    pip install -r $LOCAL_PATH/src/requirements.txt
else
    virtualenv --no-site-packages --prompt="$PROJECT_NAME-venv-" $REMOTE_PATH/venv
    pip install -r $REMOTE_PATH/src/requirements.txt
fi

header "Create database and user for project"
sudo -u postgres psql -c "CREATE DATABASE $PROJECT_NAME;"
sudo -u postgres psql -c "CREATE USER $PROJECT_NAME WITH PASSWORD 'pa55word';"
sudo -u postgres psql -c "ALTER ROLE $PROJECT_NAME SET client_encoding TO 'utf8';"
sudo -u postgres psql -c "ALTER ROLE $PROJECT_NAME SET default_transaction_isolation TO 'read committed';"
sudo -u postgres psql -c "ALTER ROLE $PROJECT_NAME SET timezone TO 'UTC';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $PROJECT_NAME TO $PROJECT_NAME;"

header "Create local settings"
if [ "$TARGET" == "local" ]; then
    cp $LOCAL_PATH/src/app/core/settings/local.py.example $LOCAL_PATH/src/app/core/settings/local.py
else
    cp $REMOTE_PATH/src/app/core/settings/local.py.example $REMOTE_PATH/src/app/core/settings/local.py
fi

header "Migrate, collect static files, create admin user"
if [ "$TARGET" == "local" ]; then
    python $LOCAL_PATH/venv/bin/python $LOCAL_PATH/src/app/manage.py migrate
    echo "    from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | $LOCAL_PATH/venv/bin/python $LOCAL_PATH/src/app/manage.py shell
    echo "    To run app call >> venv/bin/python src/app/manage.py runserver 0.0.0.0:8000"
else
    python $REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py migrate
    python $REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py collectstatic -v 0 --no-input
    echo "    from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | $REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py shell

    header "Update server configs"
    sudo ln -s $REMOTE_PATH/src/deploy/confs/nginx.conf /etc/nginx/sites-enabled/$PROJECT_NAME.conf
    sudo service nginx restart

    sudo ln -s $REMOTE_PATH/src/deploy/confs/supervisor.conf /etc/supervisor/conf.d/$PROJECT_NAME.conf
    sudo supervisorctl update
    sudo supervisorctl start $PROJECT_NAME
fi

header "All operations have done"