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
     * Full gallery template
     * @name $gallery-full
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */

?>
<div id="gallery">
    <h2><?php echo $options['data']->name; ?></h2>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
    <div class="favorite">
        <a name="image-<?php echo $options['data']->favorite->id; ?>" href="<?php echo $options['data']->favorite->link; ?>" class="thumbnail" rel="<?php echo $options['data']->favorite->id; ?>">
            <img src="<?php echo $options['data']->favorite->link; ?>" width="693" />
        </a>
    </div>
    <div class="thumbnails">
        <?php foreach ($options['data']->originals as $original) : ?>
            <a name="image-<?php echo $original->id; ?>" href="<?php echo $original->link; ?>" class="thumbnail" rel="<?php echo $original->id; ?>">
                <img src="<?php echo $original->thumbnail; ?>" width="108" height="108" />
            </a>
        <?php endforeach; ?>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        // Tracker for gallery
        $.post(
            '<?php echo Sef::getSef('index.php?module=gallery&action=track'); ?>',
            { id : <?php echo $options['data']->id; ?> }
        );
    });
</script>

<?php echo $this->getContents('gallery', 'ajax'); ?>