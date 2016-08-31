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
     * Top tags plugin
     * @name $top-tags-plugin
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */

    $i = 0;
    $tags = Model::getModel('tag')->getTags(15);
?>
<h2><?php echo T('Popular Categories'); ?></h2>
<ul id="active-tags" class="sidebar tags">
    <?php foreach($tags as $item) : ?>
        <?php
            $i++;
            if ($i > 7) {
                $i = 0;
                break;
            }
        ?>
        <li><a href="<?php echo Sef::getSef('index.php?module=tag&action=search&id=' . $item->id); ?>" title="<?php echo $item->name; ?>"><?php echo $item->name . ' <span class="tag-counter">(' . $item->count . ')</span>'; ?></a></li>
    <?php endforeach; ?>
</ul>
<ul id="hidden-tags" class="sidebar tags">
    <?php foreach($tags as $item) : ?>
        <?php
            $i++;
            if ($i <= 7) continue;
        ?>
        <li><a href="<?php echo Sef::getSef('index.php?module=tag&action=search&id=' . $item->id); ?>" title="<?php echo $item->name; ?>"><?php echo $item->name . ' <span class="tag-counter">(' . $item->count . ')</span>'; ?></a></li>
    <?php endforeach; ?>
</ul>
<div id="show-more-tags">
    <a href="#show-more-tags"><?php echo T('show more'); ?></a>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#show-more-tags a').click(function(e) {
            // Prevent click action
            e.preventDefault();

            // Show / hide additional tags
            $('#hidden-tags').toggle(400);

            // Change link label
            if ($(this).html() == '<?php echo T('show more'); ?>') {
                $(this).html('<?php echo T('show less'); ?>');
            } else {
                $(this).html('<?php echo T('show more'); ?>');
            }
        });
    });
</script>