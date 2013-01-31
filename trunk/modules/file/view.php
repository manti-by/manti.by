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
            $result  = '<ul id="download-list">';

            // Print body
            foreach ($array as $object) {
                $result .= '<li id="file-' . $object->id . '"><a href="' . str_replace('./', Application::$config['http_host'] . '/', $object->source) . '">' . $object->source . '</a> (' . System::humanReadableFilesize($object->size) . ')</li>';
            }

            $result .= '</ul>';

            return $result;
        }
    }
