<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Filesystem file list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<h1><?php echo T('Filesystem file list'); ?></h1>
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
                        var popup_block = $(response.data);
                    } else {
                        var popup_block = $(response.error);
                    }
                    $.fn.popupShow(popup_block);
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
                            var popup_block = $(response.data);
                        } else {
                            var popup_block = $(response.error);
                        }
                        $.fn.popupShow(popup_block);
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
                        var popup_block = $('<?php echo T('File removed from DB'); ?>');

                        $('#' + rel_id + ' .file-name').removeClass('green');
                        $('#' + rel_id + ' .file-actions a.file-remove').remove();
                        $('#' + rel_id + ' .file-actions').append(
                            '<a href="#add" class="file-add green" rel_id="' + rel_id + '" rel="' + response.source + '"><?php echo T('Add'); ?></a>'
                        );
                    } else {
                        var popup_block = $(response.error);
                    }
                    $.fn.popupShow(popup_block);
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


