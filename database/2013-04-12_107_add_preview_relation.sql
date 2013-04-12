DROP TABLE IF EXISTS `files_relations`;
CREATE TABLE `files_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_files_relations` (`original_id`,`target_id`),
  KEY `fk_files_relations_target_id` (`target_id`) USING BTREE,
  KEY `fk_files_relations_original_id` (`original_id`) USING BTREE,
  CONSTRAINT `fk_files_relations_target_id` FOREIGN KEY (`target_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_files_relations_original_id` FOREIGN KEY (`original_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
