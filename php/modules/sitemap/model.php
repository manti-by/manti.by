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
     * Sitemap Model class
     * @name $sitemapModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3b
     */
    class SitemapModel extends Model {

        /**
         * Return sitemap objects tree
         * @return array|bool $result
         */
        public function getSitemap() {
            $result = array(
                'blog'      => Model::getModel('blog')->getPosts(1000),
                'file'      => Model::getModel('file')->getDownloadList(),
                'gallery'   => Model::getModel('gallery')->getGallery(1000),
            );
            return $result;
        }

        /**
         * Get XML
         */
        public function getXML() {
            // Open XML
            $result  = '<?xml version="1.0" encoding="UTF-8"?>' . NL;
            $result .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">';

            // Default site link
            $result .= $this->getSitemapXMLItem(Sef::getSef('index.php'), strtotime(date('Y-m-d')), 1, 'hourly');

            // Add general blog links
            $result .= $this->getSitemapXMLItem(Sef::getSef('index.php?module=blog'), strtotime(date('Y-m-d')), 1, 'daily');

            // Static pages
            foreach (array(14, 2, 16) as $id) {
                $result .= $this->getSitemapXMLItem(Sef::getSef('index.php?module=blog&action=show&id=' . $id), strtotime(date('Y-m-01')), 0.9, 'monthly');
            }

            // Add blog posts
            foreach (Model::getModel('blog')->getPosts(1000) as $post) {
                $result .= $this->getSitemapXMLItem(Sef::getSef('index.php?module=blog&action=show&id=' . $post->id), strtotime($post->timestamp), 0.8, 'weekly');
            }

            // Add general gallery link
            $result .= $this->getSitemapXMLItem(Sef::getSef('index.php?module=gallery'), strtotime(date('Y-m-d')), 0.9, 'weekly');

            // Add gallery entries
            foreach (Model::getModel('gallery')->getGallery(1000) as $gallery) {
                $result .= $this->getSitemapXMLItem(Sef::getSef('index.php?module=gallery&action=show&id=' . $gallery->id), strtotime($gallery->timestamp), 0.7, 'weekly');
            }

            // Close XML and return
            $result .= '</urlset>';
            return $result;
        }

        /**
         * Return XML markup for sitemap item
         * @param string $link
         * @param string $timestamp
         * @param float $priority
         * @param string $frequency
         * @return string
         */
        private function getSitemapXMLItem($link, $timestamp, $priority, $frequency) {
            $result  = '  <url>' . NL;
            $result .= '    <loc>' .  $link . '</loc>' . NL;
            $result .= '    <lastmod>' . date('c', $timestamp) . '</lastmod>' . NL;
            $result .= '    <priority>' . $priority . '</priority>' . NL;
            $result .= '    <changefreq>' . $frequency . '</changefreq>' . NL;
            $result .= '  </url>' . NL;

            return $result;
        }

        /**
         * Get site links
         */
        public function getLinks() {
            $result = array();

            // Default site link
            $result[] = Sef::getSef('index.php');

            // Add general blog links
            $result[] = Sef::getSef('index.php?module=blog');

            // Static pages
            foreach (array(14, 2, 16) as $id) {
                $result[] = Sef::getSef('index.php?module=blog&action=show&id=' . $id);
            }

            // Add blog posts
            foreach (Model::getModel('blog')->getPosts(1000) as $post) {
                $result[] = Sef::getSef('index.php?module=blog&action=show&id=' . $post->id);
            }

            // Add general gallery link
            $result[] = Sef::getSef('index.php?module=gallery');

            // Add gallery entries
            foreach (Model::getModel('gallery')->getGallery(1000) as $gallery) {
                $result[] = Sef::getSef('index.php?module=gallery&action=show&id=' . $gallery->id);
            }

            // Close XML and return
            return $result;
        }
    }
