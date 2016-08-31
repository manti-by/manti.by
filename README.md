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

Current version: 0.7

Requirements:

- Basic: PHP 5.5+ (GD, CURL, Browscap), MySQL 5.0+ with MySQLi PHP driver, Memcache.


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

