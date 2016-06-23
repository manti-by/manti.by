#!/bin/sh
echo ""
echo "*** Updating system ***"
sudo apt-get update && sudo apt-get upgrade
echo ""
echo "*** Install base lamp stack ***"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y apache2 mysql-server php5 memcached
echo ""
echo "*** Install required libraries ***"
sudo apt-get install -y libapache2-mod-php5 libmcrypt4
echo ""
echo "*** Install Apache and PHP addons ***"
sudo apt-get install -y php5-common php5-cli php5-dev php5-mysql php5-gd php5-mcrypt php5-curl php-pear php5-xdebug php5-memcache
echo ""
echo "*** Enable mod rewrite ***"
sudo a2enmod rewrite
echo ""
echo "*** Update Apache and App config ***"
sudo cp /vagrant/src/confs/000-default.conf /etc/apache2/sites-available/
sudo cp /vagrant/src/confs/xdebug.ini /etc/php5/mods-available/
cp /vagrant/src/trunk/includes/config.ini.sample /vagrant/src/trunk/includes/config.ini
echo ""
echo "*** Update log files and write permissions ***"
touch /vagrant/log/app_error.log
sudo chmod -R 777 /vagrant/log
sudo chmod -R 777 /vagrant/src/trunk/language
echo ""
echo "*** Restarting apache ***"
sudo service apache2 restart
