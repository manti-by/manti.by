<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery edit form
     * @name $gallery-edit
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC1
     */
?>
<form id="edit-gallery-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="gallery" />
    <input type="hidden" name="action" value="save" />
    <input type="hidden" name="id" value="<?php echo $options['id']; ?>" />
    <p class="big">
        <?php echo T('Please enter gallery details below'); ?>
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
        <label for="path"><?php echo T('Path'); ?></label>
        <textarea name="path" id="path"><?php echo $options['path']; ?></textarea>
        <span class="form_error"></span>
    </p>
    <p>
        <label for="description"><?php echo T('Description'); ?></label>
        <textarea name="description" id="description"><?php echo $options['description']; ?></textarea>
        <span class="form_error"></span>
    </p>
    <p>
        <label for="save">&nbsp;</label>
        <input type="button" name="save" id="save" value="<?php echo T('Save'); ?>" />
    </p>
</form>

