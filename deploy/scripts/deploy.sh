#!/bin/bash
header () {
    echo -e "\e[96m\e[1m$1\e[0m"
}

header "Read the config"
CURRENT_PATH=$(pwd)
source $CURRENT_PATH/config.sh

header "Update code base"
cd $REMOTE_PATH/src/
git stash
git pull
git stash pop
git stash clear

header "Update python packages"
source $REMOTE_PATH/venv/bin/activate
pip install -r $REMOTE_PATH/src/requirements.txt

header "Update static files"
sudo chmod -R 777 $REMOTE_PATH/src/app/static/
rm -rf $REMOTE_PATH/src/app/static/
$REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py collectstatic -v 0 --no-input

header "Compress new static files"
$REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py compress --force
sudo service memcached restart

header "Run migration and restart services"
$REMOTE_PATH/venv/bin/python $REMOTE_PATH/src/app/manage.py migrate
sudo supervisorctl restart $PROJECT_NAME

header "All operations have done"
