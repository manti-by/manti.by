<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Popup plugin
     * @name $popup
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<script type="text/javascript">
    $(document).ready(function() {
        $.fn.popupShow = function(data) {
            $('#popup .content').html(data);
            $('#popup').show();
        }

        $.fn.popupHide = function() {
            var content = $('#popup .content').html();
            $('#popup .content').html('');
            $('#popup').hide();
            return content;
        }
    });
</script>
<div id="popup">
    <div class="head hide_this">[X] <?php echo T('Close'); ?></div>
    <div class="content"></div>
</div>
