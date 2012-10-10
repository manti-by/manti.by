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
        $('.file-add').click(function() {
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=add'); ?>',
                { file : $(this).attr('rel') },
                function(response) {
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $.fn.popupShow('<?php echo T('File added to DB'); ?>');
                    } else {
                        $.fn.popupShow(response.error);
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
<a href="<?php echo Sef::getSef('index.php?module=file'); ?>"><?php echo T('View DB files'); ?></a>