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
     * Filesystem file list for edit
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<h1><?php echo $options['title']; ?></h1>
<script type="text/javascript">
    $(document).ready(function() {
        $('.file-add').live('click', function() {
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=getaddform'); ?>',
                {
                    source      : $(this).attr('rel'),
                    rel_id      : $(this).attr('rel_id')
                },
                function(response) {
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $.fn.popupShow(response.data);
                    } else {
                        var popup_block = $('<div class="error-message">' + response.message + '</div>');
                        $.fn.popupShow(popup_block);
                    }
            });
        });

        $('.file-delete').live('click', function() {
            $.fn.loaderShow();
            $.post(
                    '<?php echo Sef::getSef('index.php?module=file&action=getdeleteform'); ?>',
                    {
                        source      : $(this).attr('rel'),
                        rel_id      : $(this).attr('rel_id')
                    },
                    function(response) {
                        $.fn.loaderHide();
                        if (response.result == 'success') {
                            $.fn.popupShow(response.data);
                        } else {
                            var popup_block = $('<div class="error-message">' + response.message + '</div>');
                            $.fn.popupShow(popup_block);
                        }
                    });
        });

        $('.file-remove').live('click', function() {
            var file_id = $(this).attr('rel');
            var rel_id = $(this).attr('rel_id');

            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=remove'); ?>',
                { id : file_id },
                function(response) {
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $.fn.popupShow('<?php echo T('File removed from DB'); ?>');

                        $('#' + rel_id + ' .file-name').removeClass('green');
                        $('#' + rel_id + ' .file-actions a.file-remove').remove();
                        $('#' + rel_id + ' .file-actions').append(
                            '<a href="#add" class="file-add green" rel_id="' + rel_id + '" rel="' + response.source + '"><?php echo T('Add'); ?></a>'
                        );
                    } else {
                        var popup_block = $('<div class="error-message">' + response.message + '</div>');
                        $.fn.popupShow(popup_block);
                    }
                }
            )
        });
    });
</script>
<div id="fslist">
    <?php
        if (!empty($options['data']) && count($options['data']) > 0) {
            echo $this->printFileArray($options['data']);
        } else {
            echo T('No files found');
        }
    ?>
</div>


