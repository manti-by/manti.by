<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog edit form
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     */
?>
<script type="text/javascript">
    $(document).ready(function(){
        $('#save').click(function(e){
            e.preventDefault();
            // reset errors
            $('#edit-post-form input').css('border-color', '#CCC');
            $('#edit-post-form .form_error').hide();
            
            // check fields
            if ($('#name').val() == '') {
                $('#username').css('border-color', 'red');
                $('#username').next('.form_error').html('<?php echo T('Please enter post title'); ?>').show();
            } else {
                $('#edit-post-form').submit();
            }
            return false;
        });
    });
</script>
<form id="edit-post-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="blog" />
    <input type="hidden" name="action" value="save" />
    <input type="hidden" name="id" value="<?php echo $options['id']; ?>" />
    <p class="big">
        <?php echo T('Please enter post details below'); ?>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <label for="name"><?php echo T('Title'); ?></label>
        <input type="text" name="name" id="name" value="<?php echo $options['name']; ?>" />
        <span class="form_error"></span>
    </p>
    <p>
        <label for="teaser"><?php echo T('Teaser'); ?></label>
        <textarea name="teaser" id="teaser"><?php echo $options['teaser']; ?></textarea>
        <span class="form_error"></span>
    </p>
    <p>
        <label for="description"><?php echo T('Description'); ?></label>
        <textarea name="description" id="description"><?php echo $options['description']; ?></textarea>
        <span class="form_error"></span>
    </p>
    <p>
        <label for="metadesc"><?php echo T('Metadesc'); ?></label>
        <textarea name="metadesc" id="metadesc"><?php echo $options['metadesc']; ?></textarea>
        <span class="form_error"></span>
    </p>
    <p>
        <label for="save">&nbsp;</label>
        <input type="button" name="save" id="save" value="<?php echo T('Save'); ?>" />
    </p>
</form>

