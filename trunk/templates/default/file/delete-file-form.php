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
     * Delete file form
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */
?>
<div id="delete-file-form">
    <form>
        <input type="hidden" name="file-source" id="file-source" value="<?php echo $options['data']['source']; ?>" />
        <input type="hidden" name="rel-id" id="rel-id" value="<?php echo $options['data']['rel_id']; ?>" />
        <p>
            <?php echo T('Do you want complete remove file bellow from filesystem?'); ?>
        </p>
        <p>
        <div id="file-source-label" class="bold red"><?php echo $options['data']['source']; ?></div>
        </p>
        <p class="center">
            <input type="button" name="file-delete-yes" id="file-delete-yes" value="<?php echo T('Delete'); ?>" />
            <input type="button" name="file-delete-no" id="file-delete-no" value="<?php echo T('Cancel'); ?>" />
        </p>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#delete-file-form #file-delete-yes').live('click', function() {
            var file_source = $('#delete-file-form #file-source').val();
            var rel_id = $('#delete-file-form #rel-id').val();

            $.fn.popupHide();
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=delete'); ?>',
                { source : file_source },
                function(response) {
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $.fn.popupShow('<?php echo T('File deleted from FS'); ?>');
                        $('#' + rel_id).remove();
                    } else {
                        $.fn.popupShow(response.error);
                    }
                }
            )
        });

        $('#delete-file-form #file-delete-no').live('click', function() {
            $.fn.popupHide();
        });
    });
</script>