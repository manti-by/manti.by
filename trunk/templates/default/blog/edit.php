<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog edit form
     * @name $edit-post
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<script type="text/javascript" src="<?php echo Application::$config['http_host']; ?>/assets/js/autocomplete.jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#save').click(function(e){
            e.preventDefault();

            // Reset errors
            $('#edit-post-form input').css('border-color', '#CCC');
            $('#edit-post-form .form_error').hide();
            
            // Check required fields
            if ($('#name').val() == '') {
                $('#username').css('border-color', 'red');
                $('#username').next('.form_error').html('<?php echo T('Please enter post title'); ?>').show();
            } else {
                $.fn.loaderShow();
                $.post('<?php echo Sef::getSef('index.php'); ?>', $('#edit-post-form').serialize(), function (response){
                    $.fn.loaderHide();
                    if (response.result == 'success') {
                        $.fn.popupShow('<div class="success-message"><?php echo T('Post saved successfully'); ?></div>');
                    } else {
                        $.fn.popupShow('<div class="error-message">' + response.error + '</div>');
                    }
                });
            }
            return false;
        });

        // Flip additional params
        $('#is_music').click(function() {
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
<form id="edit-post-form">
    <input type="hidden" name="module" value="blog" />
    <input type="hidden" name="action" value="save" />
    <input type="hidden" name="id" value="<?php echo $options['data']->id; ?>" />
    <h1><?php echo T('Please enter post details below'); ?></h1>

    <fieldset id="general-information">
        <h2><?php echo T('General information'); ?></h2>
        <p>
            <label for="name"><?php echo T('Title'); ?></label>
            <input type="text" name="name" id="name" value="<?php echo $options['data']->name; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="teaser"><?php echo T('Teaser'); ?></label>
            <textarea name="teaser" id="teaser"><?php echo $options['data']->teaser; ?></textarea>
            <span class="form_error"></span>
        </p>
        <p>
            <label for="description"><?php echo T('Description'); ?></label>
            <textarea name="description" id="description"><?php echo $options['data']->description; ?></textarea>
            <span class="form_error"></span>
        </p>
        <p>
            <label for="metakeys"><?php echo T('Metakeys'); ?></label>
            <?php
                $tags = new Tag($options['data']->metakeys, array('name' => 'metakeys'));
                echo $tags->render();
            ?>
            <span class="form_error"></span>
        </p>
        <p>
            <label for="metadesc"><?php echo T('Metadesc'); ?></label>
            <textarea name="metadesc" id="metadesc"><?php echo $options['data']->metadesc; ?></textarea>
            <span class="form_error"></span>
        </p>
        <p>
            <label for="is_music"><?php echo T('It is a music release'); ?></label>
            <input type="checkbox" name="is_music" id="is_music" <?php if($options['data']->is_music) echo 'value="1" checked="checked"'; else echo 'value="0"';?> />
        </p>
    </fieldset>

    <fieldset id="attachements" <?php if(!$options['data']->is_music) echo 'class="hidden"';?>>
        <h2><?php echo T('Attachements'); ?></h2>
        <p>
            <label for="preview"><?php echo T('Preview file'); ?></label>
            <?php
                $preview = new File($options['data']->preview, array('name' => 'preview', 'type' => 'preview'));
                echo $preview->render();
            ?>
        </p>
        <p>
            <label for="release"><?php echo T('Release file'); ?></label>
            <?php
                $release = new File($options['data']->release, array('name' => 'release', 'type' => 'release'));
                echo $release->render();
            ?>
        </p>
        <p>
            <label for="cover"><?php echo T('Cover file'); ?></label>
            <?php
                $cover = new File($options['data']->covers, array('name' => 'covers', 'type' => 'covers'));
                echo $cover->render();
            ?>
        </p>
        <p>
            <label for="relations"><?php echo T('Relations'); ?></label>
            <?php
                $relations = new Relations($options['data']->relations, array('name' => 'relations', 'reference_id' => $options['data']->id));
                echo $relations->render();
            ?>
        </p>
    </fieldset>

    <fieldset id="additional-info" <?php if(!$options['data']->is_music) echo 'class="hidden"';?>>
        <h2><?php echo T('Additional information'); ?></h2>
        <p>
            <label for="catnum"><?php echo T('Catalog No'); ?></label>
            <input type="text" name="catnum" id="catnum" value="<?php echo $options['data']->catnum; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="genre"><?php echo T('Genre'); ?></label>
            <input type="text" name="genre" id="genre" value="<?php echo $options['data']->genre; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="quality"><?php echo T('Quality'); ?></label>
            <input type="text" name="quality" id="quality" value="<?php echo $options['data']->quality; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="length"><?php echo T('Length'); ?></label>
            <input type="text" name="length" id="length" value="<?php echo $options['data']->length; ?>" />
            <span class="form_error"></span>
        </p>
        <p>
            <label for="tracklist"><?php echo T('Tracklist'); ?></label>
            <textarea name="tracklist" id="tracklist"><?php echo $options['data']->tracklist; ?></textarea>
            <span class="form_error"></span>
        </p>
    </fieldset>

    <p>
        <input type="button" name="save" id="save" value="<?php echo T('Save'); ?>" />
        <input type="button" name="reset" value="<?php echo T('Reset'); ?>" />
    </p>
</form>

