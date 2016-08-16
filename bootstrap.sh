#!/bin/bash
header () {
    echo "--------------------------------------------------------------------------------"
    echo $1
    echo "--------------------------------------------------------------------------------"
}

ROOT_PATH=$(pwd)

header "Updating system"
sudo apt-get update && sudo apt-get upgrade

header "Install base lamp stack"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y apache2 mysql-server php5 memcached libopencv-dev

header "Install required libraries"
sudo apt-get install -y libapache2-mod-php5 libmcrypt4 unzip

header "Install Apache and PHP addons"
sudo apt-get install -y php5-common php5-cli php5-dev php5-mysql php5-gd php5-mcrypt php5-curl php-pear php5-xdebug php5-memcache

header "Install OpenCV library"
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
wget https://github.com/Itseez/opencv/archive/2.4.13.zip
unzip opencv-2.4.13.zip
cd ./opencv-2.4.13/
mkdir build
cd ./build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
sudo make -j7
sudo make install

header "Enable PHP extension"
sudo echo "extension=opencv.so" >> /etc/php5/mods-available/opencv.ini
sudo ln -s /etc/php5/mods-available/opencv.ini /etc/php5/cli/conf.d/20-opencv.ini
sudo ln -s /etc/php5/mods-available/opencv.ini /etc/php5/apache2/conf.d/20-opencv.ini

header "Supress libdc1394 error"
sudo ln -s /dev/null /dev/raw1394

header "Deploy database"
unzip $ROOT_PATH/database/production.zip -d /tmp/
mysql -uroot -e "CREATE DATABASE manti CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot manti < /tmp/database.sql
rm /tmp/database.sql

header "Update Apache and App config"
sudo a2enmod rewrite
sudo cp $ROOT_PATH/confs/apache2.conf /etc/apache2/
sudo cp $ROOT_PATH/confs/000-default.conf /etc/apache2/sites-available/
sudo cp $ROOT_PATH/confs/xdebug.ini /etc/php5/mods-available/
cp $ROOT_PATH/app/includes/config.ini.sample ROOT_PATH/app/includes/config.ini

header "Update log files and write permissions"
touch $ROOT_PATH/../log/app_error.log
sudo chmod -R 777 $ROOT_PATH/../log
sudo chmod -R 777 $ROOT_PATH/../src/app/language

header "Restarting apache"
sudo service apache2 restart

header "All operations have done"
