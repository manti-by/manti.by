<?php
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
         * Function for translate tokens from dictionaries
         * @param array $array array to print
         * @return string $text
         */
        public function printFileArray($array) {
            // Print head
            $result  = '<table cellpadding="5" cellspacing="0" width="100%" class="file-table">';
            $result .= '<tr>';
            $result .= '<th>' . T('Filename') . '</th>';
            $result .= '<th>' . T('Filesize') . '</th>';
            $result .= '<th width="80">' . T('Actions') . '</th>';
            $result .= '</tr>';

            // Print body
            foreach ($array as $id => $current) {
                if (!isset($current['basename'])) {
                    $result .= '<tr><td colspan="3" class="bg-darkgrey white">' . $current['path'] . '</td></tr>';

                    $class = '';
                    foreach ($current['data'] as $filename => $data) {
                        $result .= '<tr>';
                        $result .= '<td>' . $data['basename'] . '</td>';
                        $result .= '<td>' . System::humanReadableFilesize($data['size']) . '</td>';
                        $result .= '<td><a href="#add" class="file-add" rel="' . $filename . '">Add</a></td>';
                        $result .= '</tr>';
                    }
                } else {
                    $result .= '<tr>';
                    $result .= '<td>' . $current['basename'] . '</td>';
                    $result .= '<td>' . System::humanReadableFilesize($current['size']) . '</td>';
                    $result .= '<td><a href="#add" class="file-add" rel="' . $id . '">Add</a></td>';
                    $result .= '</tr>';
                }
            }
            $result .= '</table>';

            return $result;
        }
    }
