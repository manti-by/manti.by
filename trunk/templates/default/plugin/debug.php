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

?>
<div id="debug" class="wrapper">
    <h2>Debug info</h2>

    <h3 class="accordion">MESSAGES STACK</h3>
    <pre><?php var_dump($stack); ?></pre>

    <h3 class="accordion">SQL QUEUE</h3>
    <pre><?php echo implode('<hr />', $sql); ?></pre>
</div>
