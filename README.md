M2 Micro CMS
============

About
-----

This is a CMS with simple functionality, such as interactions with 
database (used MySQLi), sending emails, upload files, resize images and etc.

CMS have an MVC structure with modules and have simple object behaviour
which will be very simple to understand app logic for each level of developers.

Author: Alex Manti <manti.by@gmail.com>

Source link: https://github.com/manti-by/m2/

Current version: 0.5.2

Requirements:

- Basic: PHP 5.3+ (GD, CURL, Browscap), MySQL 5.0+ with MySQLi PHP driver, Memcache.
- Advanced: CURL extension needed for stats module.


Vagrant setup
-------------

1. Clone source code from github:

    $ git clone https://github.com/manti-by/m2.git ./src

2. Create "log" directory:

    $ mkdir log
    $ chmod -R 777 log

3. Run Vagrant and await provisioning

    $ cd src/
    $ vagrant up

4. Open browser at http://192.168.1.12

    NOTICE:
    You can create "clean" database from migrations in ./src/database/. 
    For this you should use "Database migration tool", which you can find 
    in ./src/scripts directory, to run it simply call: $ ./db-migrate.sh
    

Setup Redis
-----------

    wget http://redis.googlecode.com/files/redis-2.6.9.tar.gz
    tar -zxvf redis-2.6.9.tar.gz

    cd redis-2.6.9
    sudo make
    sudo make test
    sudo make install
    
    cd utils
    sudo ./install_server.sh