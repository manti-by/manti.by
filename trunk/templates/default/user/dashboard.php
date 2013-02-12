<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * User dashboard page
     * @name $dashboard
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<div id="dashboard">
    <ul>
        <li><a href="<?php echo Sef::getSef('index.php?module=blog&action=edit');?>"><?php echo T('Add new post'); ?></a></li>
        <li><a id="update-gallery" href="<?php echo Sef::getSef('index.php?module=gallery&action=update');?>"><?php echo T('Update gallery items'); ?></a></li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#update-gallery').click(function(e) {
            e.preventDefault();
            $.fn.loaderShow();

            $.get($(this).attr('href'), function(response) {
                // Create report block
                var block = $('<ul></ul>');
                for (var i = 0; i < response.parsed.length; i++) {
                    var item = $('<li>' + response.parsed[i].source + ' : ' + response.parsed[i].status + '</li>');
                    $(block).append(item)
                }
                for (var i = 0; i < response.resized.length; i++) {
                    var item = $('<li>' + response.resized[i].source + ' : ' + response.resized[i].status + '</li>');
                    $(block).append(item)
                }

                // Show popup with report
                $.fn.loaderHide();
                $.fn.popupShow(block);
            });

            return false;
        });
    });
</script>

