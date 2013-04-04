<?php
    /**
     * Post commit hook for beta enviroment updates
     */

    system('/var/www/update-beta.sh');
