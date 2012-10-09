<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Debug panel plugin
     * @name $debug
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     */

    $stack = $this->getStack();
    $sql = $this->getSQL();

?>
<div id="debug" class="wrapper">
    <h2>Debug info</h2>

    <h3>MESSAGES STACK</h3>
    <pre><?php var_dump($stack); ?></pre>

    <h3>SQL QUEUE</h3>
    <pre><?php echo implode('<hr />', $sql); ?></pre>
</div>
