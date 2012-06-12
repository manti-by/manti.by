SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('set','preview') DEFAULT 'set',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `source` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `post_files`;
CREATE TABLE `post_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_files_post_id` (`post_id`),
  KEY `fk_post_files_file_id` (`file_id`),
  CONSTRAINT `fk_post_files_file_id` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_files_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
