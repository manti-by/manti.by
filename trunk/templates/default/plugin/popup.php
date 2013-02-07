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
            // Check size
            var margin_offset = 120;
            var popup_offset = 40;

            var new_width  = data.get(0).width > 0 ? data.get(0).width : 600;
            var new_height = data.get(0).height > 0 ? data.get(0).height : 200;

            var ratio = new_width / new_height;

            // Check width
            if (new_width + margin_offset > window.innerWidth) {
                new_width  = window.innerWidth - margin_offset;
                new_height = new_width * ratio;
            }

            // Check height
            if (new_height + margin_offset > window.innerHeight) {
                new_height = window.innerHeight - margin_offset;
                new_width  = new_height * ratio;
            }

            data.width(new_width).height(new_height);

            // Center popup block
            var width_offset = (window.innerWidth - new_width) / 2 - popup_offset;
            var height_offset = (window.innerHeight - new_height) / 2 - popup_offset;

            $('#popup').css('left', width_offset + 'px')
                    .css('top', height_offset + 'px');

            // Add content and show
            $('#popup .content').html(data);
            $('#popup').show();

            // Bind autohide for document
            $(document).bind('click', function() {
                $.fn.popupHide();
            });

            // And prevent click on content
            $('#popup .content').bind('click', function(e) {
                e.preventDefault();
                return false;
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
