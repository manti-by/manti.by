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
     * Player plugin
     * @name $loaderPlugin
     * @author Alexander Chaika a.k.a. Manti
     * @package M2 Micro Framework
     * @subpackage Plugin
     * @since 0.3RC3
     */

    $player_data = Model::getModel('file')->getPlayerContent();
    $player_source = json_encode($player_data);
    $player_default_id = (int)$player_data[0]['id'];

?>
<script type="text/javascript">
    window.player_source = <?php echo $player_source; ?>;
    window.player_default_id = <?php echo $player_default_id; ?>;
</script>
<script type="text/javascript" src="<?php echo Application::$config['http_host']; ?>/assets/js/player.js"></script>
<div id="player" class="player">
    <audio preload="auto" class="hidden"></audio>

    <div class="controls">
        <div class="button prev-track"></div>
        <div class="button play"></div>
        <div class="button next-track"></div>

        <div class="progressbar position">
            <div class="progress-line"></div>
            <div class="progress-line-loaded"></div>
            <div class="progress-line-active"></div>
            <div class="progress-line-label"><span>0</span></div>
        </div>

        <div class="progressbar volume">
            <div class="progress-line"></div>
            <div class="progress-line-active"></div>
            <div class="progress-line-label"><span>70</span>%</div>
        </div>

        <div class="high-definition">HD</div>
    </div>

    <div class="now-playing">
        <a href="#">
            <span class="image-wrapper">
                <img src="#" width="33" height="33" />
            </span>
            <span class="title-wrapper"></span>
        </a>
    </div>

    <div class="close"><i class="material-icons">close</i></div>

    <div class="cls"></div>
</div>