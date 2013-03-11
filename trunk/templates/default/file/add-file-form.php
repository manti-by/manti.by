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
     * Add file form
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */
?>
<div id="add-file-form">
    <form>
        <input type="hidden" name="file-source" id="file-source" value="<?php echo $options['data']['source']; ?>" />
        <input type="hidden" name="rel-id" id="rel-id" value="<?php echo $options['data']['rel_id']; ?>" />
        <p>
            <?php echo T('Please enter details for following file:'); ?>
        </p>
        <p>
            <div id="file-source-label" class="bold green"><?php echo $options['data']['source']; ?></div>
        </p>
        <p>
            <label for="file-name"><?php echo T('Title'); ?></label>
            <input type="text" name="file-name" id="file-name" value="" />
        </p>
        <p>
            <label for="file-description"><?php echo T('Description'); ?></label>
            <input type="text" name="file-description" id="file-description" value="" />
        </p>
        <p class="center">
            <input type="button" name="file-save" id="file-save" value="<?php echo T('Save'); ?>" />
            <input type="button" name="file-cancel" id="file-cancel" value="<?php echo T('Cancel'); ?>" />
        </p>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#add-file-form #file-save').live('click', function() {
            var file_source = $('#add-file-form #file-source').val();
            var file_name = $('#add-file-form #file-name').val();
            var file_description = $('#add-file-form #file-description').val();
            var rel_id = $('#add-file-form #rel-id').val();

            $.fn.popupHide();
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=add'); ?>',
                {
                    source      : file_source,
                    name        : file_name,
                    description : file_description
                },
                function(response) {
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $('#' + rel_id + ' .file-name').addClass('green');
                        $('#' + rel_id + ' .file-actions a.file-add').remove();
                        $('#' + rel_id + ' .file-actions').append(
                                '<a href="#remove" class="file-remove" rel_id="' + rel_id + '" rel="' + response.id + '"><?php echo T('Remove'); ?></a>'
                        );
                    } else {
                        $.fn.popupShow(response.error);
                    }
                }
            )
        });

        $('#add-file-form #file-cancel').live('click', function() {
            $.fn.popupHide();
        });
    });
</script>