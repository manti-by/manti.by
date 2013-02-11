<?php
    /**
     * CLI database migration tool for web applications.
     * Provides simple versioning mechanism for uploading MySQL migration scripts in DB.
     * @author Alexander Chaika <marco.manti@gmail.com>
     * @package M2 Micro Framework
     * @subpackage Tools
     * @version 0.2.6 beta
     */

    if (php_sapi_name() == 'cli') define('EL', PHP_EOL);
    else define('EL', '<br />');

    ini_set('error_reporting', 'E_ALL & ~E_NOTICE & ~E_DEPRECATED');

    // File options and scripts path
    define('DS', DIRECTORY_SEPARATOR);
    define('FILE_PATH', dirname(__DIR__) . DS . 'database');

    // Migration files pattern
    define('FILE_PATTERN', '/^\d{4}\-\d{2}\-\d{2}\_\d+[a-zA-Z0-9\_\-]*\.(sql)$/i');
    define('PROC_PATTERN', '/DELIMITER\s[\S]{2}(.*)[\S]{2}(\s*)DELIMITER\s;/is');

    // Parse application config and set migration table
    define('DB_TABLE', 'db_migration');
    $ini_file = dirname(__DIR__) . DS . 'trunk' . DS . 'includes' . DS . 'config.ini';
    $config = parse_ini_file($ini_file);

    // Intro text
    echo  str_repeat('-', 80) . EL
        . '  MySQL DB migration tool for web applications. Version 0.2.6 beta. ' . EL
        . '  Provides simple versioning mechanism for uploading MySQL migration scripts.' . EL
        . '  Author: Alexander Chaika <marco.manti@gmail.com>.' . EL
        . str_repeat('-', 80) . EL;

    // Connect to DB
    $cid = mysql_pconnect($config['db_path'] . ':' . $config['db_port'], $config['db_user'], $config['db_pass']);
    if (empty($cid)) close('ERROR: Could not connect to DB.');

    // Get DB
    $result = mysql_select_db($config['db_base'], $cid);
    if (!$result) {
        $result = mysql_query("CREATE DATABASE `" . $config['db_base'] . "`;", $cid);
        if (!$result) {
            close('ERROR: Could not create DB.');
        } else {
            $result = mysql_select_db($config['db_base'], $cid);
            if (!$result) {
                close('ERROR: ' . mysql_error() . '.');
            }
        }
    }

    // Check current DB version
    $result = mysql_query("SELECT `version` FROM `" . DB_TABLE . "` ORDER BY `id` DESC;", $cid);
    if ($result) {
        $current_version = reset(mysql_fetch_row($result));
        message('Current DB version ' . $current_version . '.');
    } else {
        $current_version = 0;
        message('NOTICE: Tool not installed. Try to create migration table.');

        // Try to create version table
        $result = mysql_query("
            CREATE TABLE `" . DB_TABLE . "` (
                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `version` int(10) unsigned NOT NULL DEFAULT 0,
                `comment` varchar(32) DEFAULT NULL,
                `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                PRIMARY KEY (`id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;", $cid);

        // Set initial value
        if ($result) {
            message('Migration table created successfully.');
            $result = mysql_query("INSERT INTO `" . DB_TABLE . "` (`version`) VALUES (0);", $cid);
            
            if (!$result) close('ERROR: ' . mysql_error() . '.');
            else message('Tool installed succefully.');
        } else {
            close('ERROR: ' . mysql_error() . '.');
        }
    }

    // Get migration list
    $migration_list = array();
    if (is_dir(FILE_PATH)) {
        $dir = dir(FILE_PATH);
        while (false !== ($item = $dir->read())) {
            if ($item != '.' && $item != '..' && $item != '') {
                // Check file pattern
                preg_match(FILE_PATTERN, $item, $result);
                $result = reset($result);

                // Save items with version key
                if (!empty($result)) {
                    preg_match_all('/\d+/', $result, $keys);
                    $migration_list[(int)$keys[0][3]] = $result;
                }
            }
        }
    } else {
        close('ERROR: Target source directory "' . FILE_PATH . '" not found.');
    }

    // Check migration list
    $migration_count = count($migration_list);
    if ($migration_count > 0) {
        if ($migration_count > $current_version) {
            message(($migration_count - $current_version) . ' items in migration list.');
        } else {
            close('Database already up-to-date.');
        }
    } else {
        close('NOTICE: Empty migration list.');
    }

    // Execute sql scripts after current migration
    ksort($migration_list);
    foreach ($migration_list as $version => $migration) {
        // Skip previous migrations
        if ($version > $current_version) {
            $query = trim(file_get_contents(FILE_PATH . DS . $migration));

            // Split queries in sql script
            // with procedure check
            if (preg_match('/(.*)DELIMITER(.*)/is', $query)) {
                // Explode procedure
                preg_match_all(PROC_PATTERN, $query, $matches, PREG_PATTERN_ORDER);

                // Remove procedure from query list 
                // and explode etc
                $query = str_replace($matches[0][0], '', $query);
                $query = explode(';', $query);

                // Add procedure to list
                $query[] = $matches[1][0];
            } else {
                $query = explode(';', $query);
            }

            // Trim spaces and run
            $query = array_filter(array_map('trim', $query));
            if (count($query)) {
                $errors = array();
                foreach ($query as $q) {
                    if (!empty($q)) {
                        $result = mysql_query($q, $cid);
                        if (!$result) $errors[] = mysql_error();
                    }
                }

                // Update version in DB
                if (count($errors) == 0) {
                    $comment = str_replace('_', ' ', substr($migration, 11));
                    $result = mysql_query("INSERT INTO `" . DB_TABLE . "` (`version`, `comment`) VALUES ($version, '$comment');", $cid);
                    if (!$result) close('ERROR update version: ' . mysql_error(). '.');
                    else message($comment);
                } else {
                    close('ERRORS: ' . EL . implode(EL, $errors) . EL . ' in ' . $migration . '.');
                }
            } else {
                message('NOTICE: Empty query in file ' . $migration . '.');
            }
        }
    }

    // Run cli mysql dumper
    $command  = 'mysqldump -f -R -u ' . $config['db_user'];
    $command .= ' -p' . $config['db_pass'];
    $command .= ' ' . $config['db_base'] . ' > ' . FILE_PATH . DS . 'database.sql';
    
    message('Try to run mysql cli dump tool.');
    system($command);

    close('Migration completed. Current version ' . $version . '.');
    
    // Exit message function
    function close($message) { 
        echo $message . EL . 'Close tool. Bye!' . EL;
        die;
    }
    
    // Message function
    function message($message) {
        echo $message . EL;
    }
