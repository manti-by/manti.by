<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Command Model class
     * @name $commandModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.6
     */
    class CommandModel extends Model {

        const FILE_PATTERN = '/^\d{4}\-\d{2}\-\d{2}\_\d+[a-zA-Z0-9\_\-]*\.(sql)$/i';
        const PROC_PATTERN = '/DELIMITER\s[\S]{2}(.*)[\S]{2}(\s*)DELIMITER\s;/is';
        const COMMENTS_PATTERN = '@(([\'"`]).*?[^\\\]\2)|((?:\#|--).*?$|/\*(?:[^/*]|/(?!\*)|\*(?!/)|(?R))*\*\/)\s*|(?<=;)\s+@ms';
        const DELIMITER_PATTERN = '/(.*)DELIMITER(.*)/is';

        const MIGRATION_TABLE = 'db_migration';

        /**
         * Create migration table
         * @return bool
         */
        public function resetMigrationDB() {
            // Drop old database
            $this->database->query("DROP DATABASE `" . App::$config['db_base'] . "`");
            if (!$this->database->checkResult()) return false;

            // Create new database
            $this->database->query("CREATE DATABASE `" . App::$config['db_base'] . "`");
            if (!$this->database->checkResult()) return false;

            // Try to create versioning table
            $this->database->query("
                CREATE TABLE `" . self::MIGRATION_TABLE . "` (
                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                    `version` int(10) unsigned NOT NULL DEFAULT 0,
                    `comment` varchar(255) DEFAULT NULL,
                    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    PRIMARY KEY (`id`)
                ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"
            );
            if (!$this->database->checkResult()) return false;

            // Create first record
            $this->database->query("INSERT INTO `" . self::MIGRATION_TABLE . "` (`version`) VALUES (0);");
            return $this->database->checkResult();
        }

        /**
         * Rollback migrations
         * @param $limit count of migrations to rollback
         * @return bool
         */
        public function rollbackMigrations($limit) {
            $this->database->query("DELETE FROM `" . self::MIGRATION_TABLE . "` ORDER BY `id` DESC LIMIT " . $limit . ";");
            return $this->database->checkResult();
        }

        /**
         * Get migration version
         * @return bool|integer
         */
        public function getMigrationVersion() {
            $this->database->query("SELECT `version` FROM `" . self::MIGRATION_TABLE . "` ORDER BY `id` DESC;");
            return $this->database->getField();
        }

        /**
         * Dump DB into file
         * @param string $filename
         * @return string|bool
         */
        public function dump($filename = 'database') {
            // Run cli mysql dumper
            $command  = 'mysqldump -f -R -u ' . Application::$config['db_user'];
            $command .= ' -p' . Application::$config['db_pass'];
            $command .= ' ' . Application::$config['db_base'] . ' > ' . MIGRATION_PATH . DS . $filename .'.sql';

            $result = system($command);
            if (!$result) {
                return $this->_throw('Cant dump database', ERROR);
            } else {
                return $result;
            }
        }

        /**
         * Get migration list
         * @return array|mixed
         */
        public function getMigrationList() {
            $result = array();
            if (is_dir(MIGRATION_PATH)) {
                $dir = dir(MIGRATION_PATH);
                while (false !== ($item = $dir->read())) {
                    if ($item != '.' && $item != '..' && $item != '') {
                        // Check file pattern
                        preg_match(self::FILE_PATTERN, $item, $matches);
                        $matches = reset($matches);

                        // Save items with version key
                        if (!empty($matches)) {
                            preg_match_all('/\d+/', $matches, $keys);
                            $result[(int)$keys[0][3]] = $matches;
                        }
                    }
                }
            }

            ksort($result);
            return $result;
        }

        /**
         * Migrate file
         * @param string $filename
         * @param integer $version
         * @return mixed|bool
         */
        public function migrateFile($filename, $version) {
            // Get query
            $query = trim(file_get_contents($filename));

            // Remove comments
            $query = trim(preg_replace(self::COMMENTS_PATTERN, '$1', $query));

            // Split queries in sql script
            // with procedure check
            if (preg_match(self::DELIMITER_PATTERN, $query)) {
                // Explode procedure
                preg_match_all(self::PROC_PATTERN, $query, $matches, PREG_PATTERN_ORDER);

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
                        $result = $this->database->query($q);
                        if (!$result) $errors[] = M2::error();
                    }
                }

                // Update version in DB
                if (count($errors) == 0) {
                    $name = pathinfo($filename, PATHINFO_FILENAME);
                    $comment = str_replace('_', ' ', substr($name, 11));
                    return $this->database->query("INSERT INTO `" . self::MIGRATION_TABLE . "` (`version`, `comment`) VALUES ($version, '$comment');");
                } else {
                    return $this->_throw('ERRORS: ' . NL . implode(NL, $errors) . NL . ' in ' . $filename . '.', ERROR);
                }
            } else {
                return $this->_throw('Empty query in file ' . $filename . '.', NOTICE);
            }
        }
    }
