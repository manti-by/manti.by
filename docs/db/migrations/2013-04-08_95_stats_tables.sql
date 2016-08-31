SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `stats_browser`;
CREATE TABLE `stats_browser` (
  `id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `browser`  varchar(255) NOT NULL ,
  `version`  varchar(255) NOT NULL ,
  `count`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
  `timestamp`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `stats_session`;
CREATE TABLE `stats_session` (
  `id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `session`  varchar(64) NOT NULL ,
  `count`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
  `timestamp`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;