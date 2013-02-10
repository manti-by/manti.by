<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery list template
     * @name $gallery-list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC1
     */
?>
<h1><?php echo $options['title']; ?></h1>
<div id="gallery">
    <?php echo $options['data']; ?>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('.thumbnail').click(function(e){
            e.preventDefault();

            // Show loader and get original link
            $.fn.loaderShow();
            var original = $(this).attr('href');
            var rel_id = $(this).attr('rel');

            // Ping view counter
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=track'); ?>',
                { id : rel_id }
            );

            // Preload image and show
            var image_block = $('<img src="' + original + '" />').load(function() {
                $.fn.loaderHide();
                $.fn.popupShow(image_block);
            });

            return false;
        });
    });
</script>
