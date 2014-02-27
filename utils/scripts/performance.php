<?php
    /**
     * CLI tool for liks testing.
     * @author Alexander Chaika <manti.by@gmail.com>
     * @package M2 Micro Framework
     * @subpackage Tools
     * @version 0.4.0 alpha
     */

    include 'bootstrap.php';

    define('SITE_MAP', dirname(__DIR__) . DS . '..' . DS . 'trunk' . DS . 'sitemap.xml');

    if (!file_exists(SITE_MAP)) {
        close('Sitemap file doesnt exists.');
    }

    // Parse sitemap
    $sitemap = file_get_contents(SITE_MAP);
    $sitemap = new SimpleXMLElement($sitemap);

    foreach ($sitemap->url as $url) {
        $start = time();
        $content = file_get_contents($url->loc);
        $time = time() - $start;

        if ($content) {
            message('Link ' . $url->loc . ' opened in ' . $time . 's.');
        } else {
            message('Link ' . $url->loc . ' open failed');
        }
    }

    close('Performance testing finished.');