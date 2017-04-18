#!/bin/bash
header () {
    echo -e "\e[96m\e[1m$1\e[0m"
}

header "Read the config"
CURRENT_PATH=$(pwd)
source $CURRENT_PATH/config.sh

header "Get demo DB"
ssh $REMOTE_HOST "sudo -u postgres pg_dump -d $PROJECT_NAME > $REMOTE_PATH/tmp/$PROJECT_NAME-latest.dump"
sleep 10
rm -rf $LOCAL_PATH/tmp/$PROJECT_NAME-latest.dump
scp $REMOTE_HOST:$REMOTE_PATH/tmp/$PROJECT_NAME-latest.dump $LOCAL_PATH/tmp/

header "Update local DB"
sudo -u postgres dropdb $PROJECT_NAME
sudo -u postgres psql -c "CREATE DATABASE $PROJECT_NAME;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON $PROJECT_NAME TO $PROJECT_NAME;"
sudo -u postgres psql -d $PROJECT_NAME < $LOCAL_PATH/tmp/$PROJECT_NAME-latest.dump

header "Update media files"
rm -rf $LOCAL_PATH/src/app/media/
scp -r $REMOTE_HOST:$REMOTE_PATH/src/app/media/ $LOCAL_PATH/src/app/media/

header "All operations have done"
