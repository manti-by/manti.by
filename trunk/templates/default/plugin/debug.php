<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Debug panel plugin
     * @name $debug
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC2
     */

    $stack = $this->getStack();
    $sql = $this->getSQL();

    $user = UserEntity::getInstance();
?>
<?php if ($user->getGroup() == 'Root' || Application::$config['show_debug_panel']) : ?>
    <div id="debug" class="wrapper">
        <h2>Debug info</h2>

        <h3 class="accordion">MESSAGES STACK (<?php echo count($stack); ?> items)</h3>
        <pre class="hidden"><?php var_dump($stack); ?></pre>

        <h3 class="accordion">SQL QUEUE (<?php echo count($sql); ?> items)</h3>
        <pre class="hidden"><?php echo implode('<hr />', $sql); ?></pre>
    </div>
<?php endif; ?>