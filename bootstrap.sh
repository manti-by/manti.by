#!/bin/bash
header () {
    echo "--------------------------------------------------------------------------------"
    echo $1
    echo "--------------------------------------------------------------------------------"
}

header "Updating system"
sudo apt-get update && sudo apt-get upgrade

header "Install base lamp stack"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y apache2 mysql-server php5 memcached

header "Install required libraries"
sudo apt-get install -y libapache2-mod-php5 libmcrypt4 unzip

header "Install Apache and PHP addons"
sudo apt-get install -y php5-common php5-cli php5-dev php5-mysql php5-gd php5-mcrypt php5-curl php-pear php5-xdebug php5-memcache

header "Deploy database"
unzip /vagrant/database/production.zip -d /tmp/
mysql -uroot -e "CREATE DATABASE manti CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot manti < /tmp/database.sql
rm /tmp/database.sql

header "Update Apache and App config"
sudo a2enmod rewrite
sudo cp /vagrant/src/confs/apache2.conf /etc/apache2/
sudo cp /vagrant/src/confs/000-default.conf /etc/apache2/sites-available/
sudo cp /vagrant/src/confs/xdebug.ini /etc/php5/mods-available/
cp /vagrant/src/trunk/includes/config.ini.sample /vagrant/src/trunk/includes/config.ini

header "Update log files and write permissions"
touch /vagrant/log/app_error.log
sudo chmod -R 777 /vagrant/log
sudo chmod -R 777 /vagrant/src/trunk/language

header "Restarting apache"
sudo service apache2 restart

header "All operations have done"
