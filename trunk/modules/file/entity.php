<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * File entity class
     * @name $entity
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC3
     */
    class FileEntity extends Entity {
        const TYPE_PREVIEW = 'preview';
        const TYPE_RELEASE = 'release';
        const TYPE_COVERS  = 'covers';
    }