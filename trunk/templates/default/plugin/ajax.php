<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Ajax click plugin
     * @name $ajaxPlugin
     * @author Alexander Chaika a.k.a. Manti
     * @package M2 Micro Framework
     * @subpackage Plugin
     * @since 0.3RC4
     */

?>
<script type="text/javascript">
    $(document).ready(function() {
        $.fn.ajaxClick = function() {
            $(this).each(function() {
                var self = this;
                var link = $(self).attr('href');
                var callback = $(self).attr('callback');

                $(self).bind('click', function(e) {
                    e.preventDefault();
                    $.fn.loaderShow();

                    if (link != '') {
                        $.get(link, function (response){
                            $.fn.loaderHide();
                            if (response.result == 'success') {
                                if (callback != '') eval(callback);
                                var popup_block = $('<div class="success-message">' + response.message + '</div>');
                            } else {
                                var popup_block = $('<div class="error-message">' + response.error + '</div>');
                            }
                            $.fn.popupShow(popup_block);
                        });
                    }

                    return false;
                });
            });
        }

        $('.ajax').ajaxClick();
    });
</script>