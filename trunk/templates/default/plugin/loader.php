<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Loader plugin
     * @name $loaderPlugin
     * @author Alexander Chaika a.k.a. Manti
     * @package M2 Micro Framework
     * @subpackage Plugin
     * @since 0.3RC3
     */

?>
<script type="text/javascript">
    $(document).ready(function() {
        $.fn.loaderShow = function() {
            $('#loader').show();
        }

        $.fn.loaderHide = function() {
            $('#loader').hide();
        }
    });
</script>
<div id="loader">
    <div></div>
</div>