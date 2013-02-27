<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Popup plugin
     * @name $popup
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     * @todo Fix click on popup content
     */
?>
<script type="text/javascript">
    $(document).ready(function() {
        $.fn.popupShow = function(data) {
            // Add content to popup
            $('#popup .content').append(data);
            $('#popup').show();

            // Bind autohide for document
            $(document).bind('click', function() {
                $.fn.popupHide();
            });

            // And prevent click on content
            $('#popup .content').bind('click', function(e) {
                if (e.target == this)  {
                    e.preventDefault();
                    return false;
                }
            });
        }

        $.fn.popupHide = function() {
            // Get contents and clear block
            var content = $('#popup .content').html();
            $('#popup .content').html('');

            // Hide block and return previous content
            $('#popup').hide();
            return content;
        }
    });
</script>
<div id="popup">
    <div class="head hide_this">[X] <?php echo T('Close'); ?></div>
    <div class="content"></div>
</div>
