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

    /**
     * Crontab laucher
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.5
     */

    // Simple ACL hook
    define('M2_MICRO', 1);

    // Get engine
    require_once 'bootstrap.php';

    // Init app and disable sef
    Application::init();
    Application::$config['sef_enabled'] = false;

    // Check mode
    if (php_sapi_name() == 'cli') {
        switch($argv[1]) {
            case 'dailystats';
                if (Model::getModel('stats')->processDailyStats()) {
                    Application::shutdown('Daily stats successfully processed' . NL);
                } else {
                    $error = Application::getInstance()->getLastFromStack();
                    Application::shutdown($error['message']);
                }
            case 'dailynginx';
                if (Model::getModel('stats')->processNginxStats()) {
                    Application::shutdown('Nginx stats successfully processed' . NL);
                } else {
                    $error = Application::getInstance()->getLastFromStack();
                    Application::shutdown($error['message']);
                }
            case 'batchdaily';
                Model::getModel('stats')->processBatchStats(Application::$config['batch_start'], Application::$config['batch_end'], StatsModel::DAILY_STATS);
                Application::shutdown('Batch daily stats successfully processed' . NL);
            case 'batchnginx';
                Model::getModel('stats')->processBatchStats(Application::$config['batch_start'], Application::$config['batch_end'], StatsModel::NGINX_STATS);
                Application::shutdown('Batch nginx stats successfully processed' . NL);
            default:
                Application::shutdown('You need to specify crontab action' . NL);
        }
    } else {
        Application::shutdown('You do not have perrmissions to run this script' . NL);
    }