<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery View Class
     * @name $galleryView
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class GalleryView extends View {

        /**
         * Return HTML file list
         * @param array $files
         * @return string $result
         */
        public function wrapFileList($files) {
            $result = '<ul>';
            if (count($files)) {
                foreach ($files as $file) {
                    $result .= '<li>' . $file['source'] . ' - ' . $file['status'] . '</li>';
                }
            } else {
                $result .= '<li>' . T('No new files was processed.') . '</li>';
            }
            $result .= '</ul>';

            return $result;
        }
    }
