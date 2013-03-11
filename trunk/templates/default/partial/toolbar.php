<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     * @version     0.3
     * @package     M2 Micro Framework
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
     * Toolbar plugin
     * @name $toolbar
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     * @todo Add search functionality
     */

    $user = UserEntity::getInstance();
?>
<script type="text/javascript">
    $(document).ready(function() {
        $('#switch-language').click(function() {
            document.cookie = 'language=' + $(this).attr('rel') + '; path=/; expires=Mon, 01-Jan-2030 00:00:00 GMT';
            location.href = location.href;
        });
    });
</script>
<div id="toolbar">
    <div id="language">
        <?php if (Application::$config['language'] == 'ru') : ?>
            <a href="#switch-to-english" id="switch-language" rel="en">
                <img src="<?php echo Application::$config['http_host']; ?>/assets/images/language-en.png" alt="EN" />
                <?php echo T('English version'); ?>
            </a>
        <?php else : ?>
            <a href="#switch-to-russian" id="switch-language" rel="ru">
                <img src="<?php echo Application::$config['http_host']; ?>/assets/images/language-ru.png" alt="RU" />
                <?php echo T('Russian version'); ?>
            </a>
        <?php endif; ?>
    </div>
    <div id="search">
        <input type="text" id="query" name="q" value="" placeholder="<?php echo T('Search'); ?>..." />
        <input type="button" id="go" name="go" value=" " />
    </div>
</div>
