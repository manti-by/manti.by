<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog edit form
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
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

        $('#is_release').click(function() {
            if ($(this).val() == 0) {
                $('#attachements').show();
                $('#additional-info').show();
                $(this).val(1);
            } else {
                $('#attachements').hide();
                $('#additional-info').hide();
                $(this).val(0);
            }
        });
    });
</script>
<form id="edit-post-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="blog" />
    <input type="hidden" name="action" value="save" />
    <input type="hidden" name="id" value="<?php echo $options['id']; ?>" />
    <h1><?php echo T('Please enter post details below'); ?></h1>

    <fieldset id="general-information">
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
        <p>
            <label for="is_music"><?php echo T('It is a music release'); ?></label>
            <input type="checkbox" name="is_music" id="is_music" value="1" checked="checked" />
        </p>
    </fieldset>

    <fieldset id="attachements">
        <h2><?php echo T('Attachements'); ?></h2>
        <p>
            <label for="preview"><?php echo T('Preview file'); ?></label>
            <?php
                $preview = new File($options['preview'], array('name' => 'preview', 'type' => 'preview'));
                echo $preview->render();
            ?>
        </p>
        <p>
            <label for="release"><?php echo T('Release file'); ?></label>
            <?php
                $release = new File($options['release'], array('name' => 'release', 'type' => 'release'));
                echo $release->render();
            ?>
        </p>
        <p>
            <label for="cover"><?php echo T('Cover file'); ?></label>
            <?php
                $cover = new File($options['covers'], array('name' => 'covers', 'type' => 'covers'));
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

    <fieldset id="additional-info">
        <h2><?php echo T('Additional information'); ?></h2>
        <p>
            <label for="catnum"><?php echo T('Catalog No'); ?></label>
            <input type="text" name="catnum" id="catnum" value="<?php echo $options['catnum']; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="genre"><?php echo T('Genre'); ?></label>
            <input type="text" name="genre" id="genre" value="<?php echo $options['genre']; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="quality"><?php echo T('Quality'); ?></label>
            <input type="text" name="quality" id="quality" value="<?php echo $options['quality']; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="length"><?php echo T('Length'); ?></label>
            <input type="text" name="length" id="length" value="<?php echo $options['length']; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="tracklist"><?php echo T('Tracklist'); ?></label>
            <textarea name="tracklist" id="tracklist"><?php echo $options['tracklist']; ?></textarea>
            <span class="form_error"></span>
        </p>
    </fieldset>

    <p>
        <input type="button" name="save" id="save" value="<?php echo T('Save'); ?>" />
        <input type="button" name="reset" value="<?php echo T('Reset'); ?>" />
    </p>
</form>

