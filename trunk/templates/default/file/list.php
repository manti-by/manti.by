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
            $('#add-file-form #file-source').val($(this).attr('rel'));
            $('#add-file-form #file-source-label').html($(this).attr('rel'));
            $('#add-file-form #rel-id').val($(this).attr('rel_id'));
            $.fn.popupShow($('#add-file-form').html());
        });

        $('#popup #file-save').live('click', function() {
            var file_source = $('#popup .content #file-source').val();
            var file_name = $('#popup .content #file-name').val();
            var file_description = $('#popup .content #file-description').val();
            var rel_id = $('#popup .content #rel-id').val();

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
                        $.fn.popupShow('<?php echo T('File saved into DB'); ?>');

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

        $('#popup #file-cancel').live('click', function() {
            $.fn.popupHide();
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
                        $.fn.popupShow(response.error);
                    }
                }
            )
        });

        $('.file-delete').live('click', function() {
            $('#delete-file-form #file-source').val($(this).attr('rel'));
            $('#delete-file-form #file-source-label').html($(this).attr('rel'));
            $('#delete-file-form #rel-id').val($(this).attr('rel_id'));
            $.fn.popupShow($('#delete-file-form').html());
        });

        $('#popup #file-delete-yes').live('click', function() {
            var file_source = $('#popup .content #file-source').val();
            var rel_id = $('#popup .content #rel-id').val();

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

        $('#popup #file-delete-no').live('click', function() {
            $.fn.popupHide();
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

<div id="add-file-form" class="hidden">
    <form>
        <input type="hidden" name="file-source" id="file-source" value="" />
        <input type="hidden" name="rel-id" id="rel-id" value="" />
        <p>
            <?php echo T('Please enter details for following file:'); ?>
        </p>
        <p>
            <div id="file-source-label" class="bold green"></div>
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

<div id="delete-file-form" class="hidden">
    <form>
        <input type="hidden" name="file-source" id="file-source" value="" />
        <input type="hidden" name="rel-id" id="rel-id" value="" />
        <p>
            <?php echo T('Do you want complete remove file bellow from filesystem?'); ?>
        </p>
        <p>
            <div id="file-source-label" class="bold red"></div>
        </p>
        <p class="center">
            <input type="button" name="file-delete-yes" id="file-delete-yes" value="<?php echo T('Delete'); ?>" />
            <input type="button" name="file-delete-no" id="file-delete-no" value="<?php echo T('Cancel'); ?>" />
        </p>
    </form>
</div>