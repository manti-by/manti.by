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
     * File View Class
     * @name $fileView
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class FileView extends View {

        /**
         * Function for file grid creation
         * @param array $array array to print
         * @return string $text
         */
        public function printFileArray($array) {
            // Print head
            $result  = '<table id="file-table" cellpadding="5" cellspacing="0" width="100%">';
            $result .= '<thead>';
            $result .= '<tr>';
            $result .= '<th>' . T('Filename') . '</th>';
            $result .= '<th>' . T('Filesize') . '</th>';
            $result .= '<th width="120">' . T('Actions') . '</th>';
            $result .= '</tr>';
            $result .= '<thead>';
            $result .= '<tbody>';

            // Print body
            $i = 0;
            foreach ($array as $id => $current) {
                if (!isset($current['basename'])) {
                    $result .= '<tr><td colspan="3" class="bg-darkgrey white">' . $current['path'] . '</td></tr>';

                    foreach ($current['data'] as $filename => $data) {
                        $db_file_exist = isset($data['id']) && $data['id'] > 0 ? true : false;
                        $class = $db_file_exist ? ' green' : '';

                        $result .= '<tr id="file-'.$i.'">';
                        $result .= '<td class="file-name'.$class.'">' . $data['basename'] . '</td>';
                        $result .= '<td class="file-size">' . System::humanReadableFilesize($data['size']) . '</td>';

                        $result .= '<td class="file-actions"><a href="#delete" class="file-delete red" rel_id="file-'.$i.'" rel="' . $filename . '">' . T('Delete') . '</a> ';
                        if ($db_file_exist) {
                            $result .= '<a href="#remove" class="file-remove" rel_id="file-'.$i.'" rel="' . $data['id'] . '">' . T('Remove') . '</a></td>';
                        } else {
                            $result .= '<a href="#add" class="file-add green" rel_id="file-'.$i.'" rel="' . $filename . '">' . T('Add') . '</a></td>';
                        }

                        $result .= '</tr>';
                        $i++;
                    }
                } else {
                    $db_file_exist = isset($data['id']) && $data['id'] > 0 ? true : false;
                    $class = $db_file_exist ? ' green' : '';

                    $result .= '<tr id="file-'.$i.'">';
                    $result .= '<td class="file-name'.$class.'">' . $current['basename'] . '</td>';
                    $result .= '<td class="file-size">' . System::humanReadableFilesize($current['size']) . '</td>';

                    $result .= '<td class="file-actions"><a href="#delete" class="file-delete red" rel_id="file-'.$i.'" rel="' . $id . '">' . T('Delete') . '</a> ';
                    if ($db_file_exist) {
                        $result .= '<a href="#remove" class="file-remove" rel_id="file-'.$i.'" rel="' . $data['id'] . '">' . T('Remove') . '</a></td>';
                    } else {
                        $result .= '<a href="#add" class="file-add green" rel_id="file-'.$i.'" rel="' . $id . '">' . T('Add') . '</a></td>';
                    }

                    $result .= '</tr>';
                }
                $i++;
            }
            $result .= '</tbody>';
            $result .= '</table>';

            return $result;
        }

        /**
         * Function for file download list creation
         * @param array $array array to print
         * @return string $text
         */
        public function printDownloadList($array) {
            // Print head
            $result  = '<table id="file-table" cellpadding="5" cellspacing="0" width="100%">';
            $result .= '<thead>';
            $result .= '<tr>';
            $result .= '<th>' . T('Filename') . '</th>';
            $result .= '<th>' . T('Filesize') . '</th>';
            $result .= '<th>' . T('MD5 Sum') . '</th>';
            $result .= '<th>' . T('Date created') . '</th>';
            $result .= '</tr>';
            $result .= '<thead>';
            $result .= '<tbody>';

            // Print body
            foreach ($array as $object) {
                $result .= '<tr id="file-'.  $object->id .'">';
                $result .= '<td class="file-name"><a href="' . str_replace('./', Application::$config['http_host'] . '/', $object->source) . '" rel="' . $object->id . '">' . end(explode('/', $object->source)) . '</a></td>';
                $result .= '<td class="file-size">' . System::humanReadableFilesize($object->size) . '</td>';
                $result .= '<td class="file-md5">' . $object->md5 . '</td>';
                $result .= '<td class="file-date">' . date('d-m-Y', strtotime($object->timestamp)) . '</td>';
                $result .= '</tr>';
            }

            $result .= '</tbody>';
            $result .= '</table>';

            return $result;
        }
    }
