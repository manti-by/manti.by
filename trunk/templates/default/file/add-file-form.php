<?php
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