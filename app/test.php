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
     * Script for testing purposes
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */

    // Simple ACL hook
    define('M2_MICRO', 1);

    // Get engine
    require_once 'bootstrap.php';

    // Init app and disable sef
    M2::init();

    // Check mode
    if (php_sapi_name() == 'cli') {

        System::getInstance()->resize(
            ROOT_PATH . '/content/gallery/originals/autumn-12/DSC04353.JPG',
            ROOT_PATH . '/content/gallery/DSC04353.jpg',
            Application::$config['preview_width'],
            Application::$config['preview_height'],
            System::RESIZE_HEAD_ON
        );

        System::getInstance()->resize(
            ROOT_PATH . '/content/gallery/originals/winter-16/DSC00110.JPG',
            ROOT_PATH . '/content/gallery/DSC00110.jpg',
            Application::$config['preview_width'],
            Application::$config['preview_height'],
            System::RESIZE_HEAD_ON
        );

        System::getInstance()->resize(
            ROOT_PATH . '/content/gallery/originals/winter-16/DSC02248.jpg',
            ROOT_PATH . '/content/gallery/DSC02248.jpg',
            Application::$config['preview_width'],
            Application::$config['preview_height'],
            System::RESIZE_HEAD_ON
        );

        M2::shutdown();
    } else {
        M2::shutdown('You do not have perrmissions to run this script' . NL);
    }