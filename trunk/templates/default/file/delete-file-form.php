<?php
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
                        var popup_block = $('<?php echo T('File deleted from FS'); ?>');
                        $('#' + rel_id).remove();
                    } else {
                        var popup_block = $(response.error);
                    }
                    $.fn.popupShow(popup_block);
                }
            )
        });

        $('#delete-file-form #file-delete-no').live('click', function() {
            $.fn.popupHide();
        });
    });
</script>