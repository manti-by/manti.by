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
     * Gallery Entity class
     * @name $database
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.5.2
     */
    
    class GalleryEntity extends Entity {

        /**
         * @var int $id
         */
        public $id;

        /**
         * @var int $gallery_id
         */
        public $gallery_id;

        /**
         * @var string $gallery_link
         */
        public $gallery_link;

        /**
         * @var string $source
         */
        public $source;

        /**
         * @var string $original
         */
        public $original;

        /**
         * @var string $thumbnail
         */
        public $thumbnail;

        /**
         * @var string $preview
         */
        public $preview;

        /**
         * @var string $fullhd
         */
        public $fullhd;


        public function __construct($object) {
            parent::__construct($object);

            if ($this->gallery_id) {
                $this->gallery_link = Sef::getSef('index.php?module=gallery&action=show&id=' . $this->gallery_id);
            }
            if ($this->source) {
                $this->original = $this->getLink('original');
                $this->thumbnail = $this->getLink('thumbnails');
                $this->preview = $this->getLink('preview');
                $this->fullhd = $this->getLink('fullhd');
            }
        }

        public function getLink($type = 'original') {
            return $type != 'original' ?
                Application::$config['http_host'] . substr(str_replace('originals', $type, $this->source), 1) :
                Application::$config['http_host'] . substr($this->source, 1);
        }
    }
