<?php
    /**
      * @author Alexander Chaika
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
<form id="logout-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="user" />
    <input type="hidden" name="action" value="logout" />
    <p class="big">
        <?php echo T('To leave closed site areas please press logout'); ?>
    </p>
    <p>
        <label>&nbsp;</label>
        <input type="submit" name="submit" value="<?php echo T('Logout'); ?>" />
    </p>
</form>

