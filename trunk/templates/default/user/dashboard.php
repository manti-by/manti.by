<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * User dashboard page
     * @name $dashboard
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<h1>
    <?php echo $options['title']; ?>
</h1>
<div id="dashboard">
    <div id="menu-block">
        <h2>
            <?php echo T('Default actions'); ?>
        </h2>
        <ul>
            <li><a href="<?php echo Sef::getSef('index.php?module=blog&action=edit');?>"><?php echo T('Add new post'); ?></a></li>
            <li><a href="<?php echo Sef::getSef('index.php?module=file&action=edit');?>"><?php echo T('View Files'); ?></a></li>
            <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=gallery&action=updatefiles');?>"><?php echo T('Update gallery items'); ?></a></li>
            <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=gallery&action=rebuildthumbnails');?>"><?php echo T('Rebuild thumbnails'); ?></a></li>
            <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=gallery&action=updatethumbnails');?>"><?php echo T('Update thumbnails'); ?></a></li>
            <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=sitemap&action=generate');?>"><?php echo T('Generate sitemap'); ?></a></li>
        </ul>
        <ul>
            <li><a href="http://www.google.com/webmasters" target="_blank">Google Webmaster</a> / <a href="http://www.google.com/analytics" target="_blank">Analitycs</a></li>
            <li><a href="http://webmaster.yandex.ru/" target="_blank">Yandex webmaster</a> / <a href="http://metrika.yandex.ru/" target="_blank">Metrika</a></li>
            <li><a href="https://developers.google.com/speed/pagespeed/insights" target="_blank">Pagespeed Check</a></li>
            <li><a href="http://validator.w3.org/" target="_blank">W3C Validation</a></li>
            <li><a href="http://2ip.ru/whois/" target="_blank">Whois IP</a></li>
        </ul>
        <div class="cls"></div>
    </div>
    <div id="stats-block">
        <h2>
            <?php echo T('Statistics'); ?>
        </h2>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", { packages: ["corechart"]});
            google.setOnLoadCallback(drawBrowsersChart);
            google.setOnLoadCallback(drawSessionsChart);
            google.setOnLoadCallback(drawVisitorsChart);

            google.setOnLoadCallback(drawNginxChart);
            google.setOnLoadCallback(drawTrackChart);

            function drawBrowsersChart() {
                var data = google.visualization.arrayToDataTable(<?php echo $options['data']['browsers']; ?>);
                var options = {
                    height: 400,
                    title: '<?php echo T('Browser statistics'); ?>',
                    chartArea: { width: 650}
                }

                var chart = new google.visualization.PieChart(document.getElementById('browser-stats-chart'));
                chart.draw(data, options);
            }

            function drawSessionsChart() {
                var data = google.visualization.arrayToDataTable(<?php echo $options['data']['sessions']; ?>);
                var options = {
                    height: 400,
                    title: '<?php echo T('Session statistics'); ?>',
                    chartArea: { width: 650}
                }

                var chart = new google.visualization.PieChart(document.getElementById('sessions-stats-chart'));
                chart.draw(data, options);
            }

            function drawVisitorsChart() {
                var data = google.visualization.arrayToDataTable(<?php echo $options['data']['visitors']; ?>);
                var options = {
                    width: 960,
                    height: 500,
                    title: '<?php echo T('Session statistics by date'); ?>',
                    hAxis: { title: '<?php echo T('Date'); ?>'},
                    chartArea: { width: '50%'}
                };

                var chart = new google.visualization.AreaChart(document.getElementById('visitors-stats-chart'));
                chart.draw(data, options);
            }

            function drawNginxChart() {
                var data = google.visualization.arrayToDataTable(<?php echo $options['data']['nginx']; ?>);
                var options = {
                    width: 960,
                    height: 500,
                    title: '<?php echo T('Nginx statistics'); ?>',
                    hAxis: { title: '<?php echo T('Count'); ?>'},
                    chartArea: { width: '50%'},
                    bar: { groupWidth: '80%' }
                };

                var chart = new google.visualization.BarChart(document.getElementById('nginx-stats-chart'));
                chart.draw(data, options);
            }

            function drawTrackChart() {
                var data = google.visualization.arrayToDataTable(<?php echo $options['data']['track']; ?>);
                var options = {
                    width: 960,
                    height: 500,
                    title: '<?php echo T('Track statistics'); ?>',
                    hAxis: { title: '<?php echo T('Count'); ?>'},
                    chartArea: { width: '50%'},
                    bar: { groupWidth: '80%' }
                };

                var chart = new google.visualization.BarChart(document.getElementById('track-stats-chart'));
                chart.draw(data, options);
            }
        </script>
        <div>
            <div id="browser-stats-chart" class="l50"></div>
            <div id="sessions-stats-chart" class="r50"></div>
            <div class="cls"></div>
        </div>
        <div id="visitors-stats-chart"></div>
        <div id="nginx-stats-chart"></div>
        <div id="track-stats-chart"></div>
    </div>
</div>

