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
    <h1><?php echo T('Please enter post details below'); ?></h1>
    <fieldset>
        <h2><?php echo T('General information'); ?></h2>
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
            <label for="metakeys"><?php echo T('Metakeys'); ?></label>
            <?php
                $tags = new Tag($options['metakeys'], array('name' => 'metakeys'));
                echo $tags->render();
            ?>
            <span class="form_error"></span>
        </p>
        <p>
            <label for="metadesc"><?php echo T('Metadesc'); ?></label>
            <textarea name="metadesc" id="metadesc"><?php echo $options['metadesc']; ?></textarea>
            <span class="form_error"></span>
        </p>
    </fieldset>
    <fieldset>
        <h2><?php echo T('Additional information'); ?></h2>
        <p>
            <label for="preview"><?php echo T('Preview file'); ?></label>
            <?php
                $preview = new File($options['preview_id'], array('name' => 'preview', 'type' => 'preview'));
                echo $preview->render();
            ?>
        </p>
        <p>
            <label for="release"><?php echo T('Release file'); ?></label>
            <?php
                $release = new File($options['release_id'], array('name' => 'release', 'type' => 'release'));
                echo $release->render();
            ?>
        </p>
        <p>
            <label for="cover"><?php echo T('Cover file'); ?></label>
            <?php
                $cover = new File($options['cover_id'], array('name' => 'cover', 'type' => 'cover'));
                echo $cover->render();
            ?>
        </p>
        <p>
            <label for="relations"><?php echo T('Relations'); ?></label>
            <?php
                $relations = new Relations($options['relations'], array('name' => 'relations'));
                echo $relations->render();
            ?>
        </p>
    </fieldset>
    <p>
        <input type="button" name="save" id="save" value="<?php echo T('Save'); ?>" class="red-button" />
        <input type="button" name="reset" value="<?php echo T('Reset'); ?>" class="red-button" />
    </p>
</form>

