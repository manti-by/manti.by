DROP TABLE IF EXISTS `gallery_files`;
CREATE TABLE `gallery_files` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `gallery_id` int(10) unsigned NOT NULL,
    `file_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_gallery_files_file_id` (`file_id`),
    KEY `fk_gallery_files_gallery_id` (`gallery_id`),
    CONSTRAINT `fk_gallery_files_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_gallery_files_file_id` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;