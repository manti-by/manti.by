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
     * Command Controller class
     * @name $commandController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.6
     */
    class CommandController extends Controller {

        /**
         * Output message
         * @var
         */
        private $_output;

        /**
         * Route command to action
         */
        public function route($options) {
            $action = isset($options[1]) ? $options[1] : 0;
            switch($action) {
                case '-d':
                case '--dailystats':
                    $this->dailystatsAction();
                    break;
                case '-n':
                case '--dailynginx':
                    $this->dailynginxAction();
                    break;
                case '-b':
                case '--batchdaily':
                    $this->batchstatsAction();
                    break;
                case '-c':
                case '--batchnginx':
                    $this->batchnginxAction();
                    break;
                case '-p':
                case '--performance':
                    $this->performanceAction();
                    break;
                case '-l':
                case '--rollback':
                    $key = in_array('-l', $options) ? array_search('-l', $options) : false;
                    $key = !$key && in_array('--rollback', $options) ? array_search('--rollback', $options) : false;
                    $limit = $key && (int)$options[$key + 1] > 0 ? (int)$options[$key + 1] : 1;
                    $this->rollbackAction($limit);
                    break;
                case '-r':
                case '--remigrate':
                    $this->remigrateAction();
                    break;
                case '-m':
                case '--migrate':
                    $this->migrateAction();
                    break;
                case '-t':
                case '--thumbs':
                    $this->rebuildThumbnailsAction();
                    break;
                case '-s':
                case '--sitemap':
                    $this->generateSitemapAction();
                    break;
                case '-u':
                case '--update':
                    $this->updateGalleryFilesAction();
                    break;
                case '-h':
                case '--help':
                default:
                    $this->helpAction();
            }
        }

        /**
         * Process daily stats
         */
        protected function dailystatsAction() {
            if (Model::getModel('stats')->processDailyStats()) {
                $this->_output = 'Daily stats successfully processed';
            } else {
                $this->_output = M2::error();
            }
        }

        /**
         * Process daily nginx stats
         */
        protected function dailynginxAction() {
            if (Model::getModel('stats')->processNginxStats()) {
                $this->_output = 'Nginx stats successfully processed';
            } else {
                $this->_output = M2::error();
            }
        }

        /**
         * Process batch stats
         */
        protected function batchstatsAction() {
            Model::getModel('stats')->processBatchStats(
                M2::$config['batch_start'], M2::$config['batch_end'], StatsModel::DAILY_STATS
            );
            $this->_output = 'Batch daily stats successfully processed';
        }

        /**
         * Process batch nginx stats
         */
        protected function batchnginxAction() {
            Model::getModel('stats')->processBatchStats(
                M2::$config['batch_start'], M2::$config['batch_end'], StatsModel::NGINX_STATS
            );
            $this->_output = 'Batch nginx stats successfully processed';
        }

        /**
         * Check all site links
         * @return array $result
         */
        protected function performanceAction() {
            $result = array();
            $error = array();

            $links = Model::getModel('sitemap')->getLinks();
            foreach ($links as $link) {
                $start = time();
                $content = file_get_contents($link);
                $time = time() - $start;

                if ($content) {
                    $result[] = $time;
                } else {
                    $error[] = $link;
                }
            }

            $this->_output = 'Average response time: ' . (array_sum($result) / count($result)) . '; ' .
                count($error) . ' link(s) failed;';
        }

        /**
         * Migrate action
         */
        protected function migrateAction() {
            // Get migration list
            $migrations = $this->model->getMigrationList();
            if (count($migrations) == 0) {
                $this->_output = 'WARNING: Cant find any migrations.';
                return;
            }

            // Check migration list
            $version = $this->model->getMigrationVersion();
            if (count($migrations) <= $version) {
                $this->_output = 'NOTICE: Database already up-to-date.';
                return;
            }

            // Execute sql scripts after current migration
            $migrated = 0;
            foreach ($migrations as $migration_version => $migration) {
                // Skip previous migrations
                if ($migration_version > $version) {
                    if (file_exists(MIGRATION_PATH . DS . $migration)) {
                        if (!$this->model->migrateFile(MIGRATION_PATH . DS . $migration, $migration_version)) {
                            $this->_output = M2::error();
                            return;
                        }
                        $migrated++;
                    } else {
                        $this->_output = 'ERROR: Migration ' . $migration . ' doesnt exists';
                        return;
                    }
                }
            }

            $this->_output = $migrated . ' successfully migrated';
        }

        /**
         * Remigrate action
         */
        protected function remigrateAction() {
            // Get rollback depth
            echo 'This action will destroy your current DB. Are you sure to do this? [y/N]' . NL;
            $confirmation = trim(fgets(STDIN));
            if ($confirmation !== 'y' && $confirmation !== 'Y') {
                $this->_output = 'Action cancelled.';
                return;
            }

            // Dump current DB
            if (!$this->model->dump('backup_' . date('Ymdhi'))) {
                $this->_output = M2::error();
                return;
            }

            // Create
            if (!$this->model->resetMigrationDB()) {
                $this->_output = M2::error();
                return;
            }

            // Run full migration
            $this->migrateAction();
        }

        /**
         * Rollback migrations
         * @param int $limit migrations
         */
        protected function rollbackAction($limit) {
            // Rollback latest migrations
            if (!$this->model->rollbackMigrations($limit)) {
                $this->_output = M2::error();
                return;
            }

            // Check version
            $version = $this->model->getMigrationVersion();
            if (!$version) {
                $this->_output = M2::error();
                return;
            }

            $this->_output = 'Rollback action complete. Current DB version ' . $version . '.';
        }

        /**
         * Rebuild thumbnails
         * @param bool $is_update
         */
        protected function rebuildThumbnailsAction($is_update = false) {
            // Rollback latest migrations
            if (!Model::getModel('gallery')->rebuildThumbnails($is_update)) {
                $this->_output = M2::error();
                return;
            }

            $this->_output = 'Rebuild thumbnails action complete.';
        }

        /**
         * Update gallery list
         */
        protected function updateGalleryFilesAction() {
            // Rollback latest migrations
            if (!Model::getModel('gallery')->updateFSList()) {
                $this->_output = M2::error();
                return;
            }

            $this->_output = 'Rebuild thumbnails action complete.';
        }

        /**
        * Update gallery list
        */
        protected function generateSitemapAction() {

            $sitemap = ROOT_PATH . DS . 'sitemap.xml';

            // Delete old map
            if (file_exists($sitemap)) {
                if (!unlink($sitemap)) {
                    $this->_output = 'ERROR: Cant delete old sitemap.';
                    return;
                }
            }

            // Create new
            if (!file_put_contents($sitemap, Model::getModel('sitemap')->getXML())) {
                $this->_output = 'ERROR: Cant put new sitemap content to the file.';
                return;
            }

            $this->_output = 'Generate sitemap action complete.';
        }

        /**
         * Return result message
         * @return mixed
         */
        protected function helpAction() {
            $this->_output = str_repeat('-', 80) . NL
                . '  Command line tool for M2 Micro CMS. Version 0.2.1 beta. ' . NL
                . '  Author: Alexander Chaika <manti.by@gmail.com>.' . NL
                . NL
                . '  Usage: php -f command.php -- [OPTIONS]' . NL
                . '      [-b, --batchdaily]     Process batch stats' . NL
                . '      [-c, --batchnginx]     Process batch nginx stats' . NL
                . '      [-d, --dailystats]     Process daily stats' . NL
                . '      [-h, --help]           Show this help' . NL
                . '      [-l, --rollback]       Rollback last migration' . NL
                . '      [-m, --migrate]        Apply latest migrations' . NL
                . '      [-n, --dailynginx]     Process daily nginx stats' . NL
                . '      [-p, --performance]    Check all site links' . NL
                . '      [-r, --remigrate]      Remigrate all DB migrations' . NL
                . '      [-s, --sitemap]        Generate new sitemap' . NL
                . '      [-t, --thumbs]         Rebuild thumbnails' . NL
                . str_repeat('-', 80);
        }

        /**
         * Return result message
         * @return mixed
         */
        public function getOutput() {
            return $this->_output;
        }
    }
