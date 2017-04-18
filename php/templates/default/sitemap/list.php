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
     * Sitemap template
     * @name $sitemap-list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3b
     */
?>
<?php if (!empty($options['title'])) : ?>
    <h1><?php echo $options['title']; ?></h1>
<?php endif; ?>

<div id="sitemap">
    <ul class="l50">
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=14'); ?>" rel="author">
                <?php echo T('For club promouters'); ?>
            </a>
        </li>
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=2'); ?>" rel="author">
                <?php echo T('For IT HRs and developers'); ?>
            </a>
        </li>
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=16'); ?>" rel="license">
                <?php echo T('Rules and Copyrights'); ?>
            </a>
        </li>
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=blog'); ?>" rel="bookmark">
                <?php echo T('All blog posts'); ?>
            </a>
            <ul>
                <?php if (count($options['data']['blog'])) : ?>
                    <?php foreach ($options['data']['blog'] as $post) : ?>
                        <li>
                            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $post->id); ?>">
                                <?php echo $post->name; ?>
                            </a>
                            <span class="label">
                                [<?php echo date('d-m-Y', strtotime($post->created)); ?>]
                            </span>
                        </li>
                    <?php endforeach; ?>
                <?php endif; ?>
            </ul>
        </li>
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=gallery'); ?>" rel="bookmark">
                <?php echo T('Gallery'); ?>
            </a>
            <ul>
                <?php if (count($options['data']['gallery'])) : ?>
                    <?php foreach ($options['data']['gallery'] as $gallery) : ?>
                        <li>
                            <a href="<?php echo Sef::getSef('index.php?module=gallery&action=show&id=' . $gallery->id); ?>">
                                <?php echo $gallery->name; ?>
                            </a>

                            <a href="#open" class="open-spoiler label">
                                [<?php echo T('Show images list'); ?>]
                            </a>
                            <ul class="spoiler">
                                <?php if (count($gallery->originals)) : ?>
                                    <?php foreach ($gallery->originals as $original) : ?>
                                        <li>
                                            <a href="<?php echo $original->link; ?>">
                                                <?php echo $original->link; ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </ul>
                        </li>
                    <?php endforeach; ?>
                <?php endif; ?>
            </ul>
        </li>
    </ul>
    <ul class="r50">
        <li>
            <a href="<?php echo Sef::getSef('index.php?module=file'); ?>" rel="bookmark">
                <?php echo T('Direct links'); ?>
            </a>
            <ul>
                <?php if (count($options['data']['file'])) : ?>
                    <?php foreach ($options['data']['file'] as $file) : ?>
                        <li>
                            <a href="<?php echo str_replace('./', Application::$config['http_host'] . '/', $file->source); ?>">
                                <?php echo end(explode('/', $file->source)); ?>
                            </a>
                            <span class="label">
                                [<?php echo System::humanReadableFilesize($file->size); ?>]
                            </span>
                        </li>
                    <?php endforeach; ?>
                <?php endif; ?>
            </ul>
        </li>
    </ul>
    <div class="cls"></div>
</div>