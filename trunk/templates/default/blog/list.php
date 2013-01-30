<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog category template
     * @name $blog-list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<?php if (!empty($options['title'])) : ?>
    <h1><?php echo $options['title']; ?></h1>
<?php endif; ?>

<?php echo $options['data']; ?>
