<?php
    /**
     * Offline page template
     * @name $offline
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */
?>
<div id="offline" class="wrapper">
    <h1 class="red"><?php echo '[' . getErrorStringFromInt($options['data']['level']) . '] ' . $options['data']['message']; ?></h1>
    <pre><?php var_dump(debug_backtrace()) ?></pre>
</div>
