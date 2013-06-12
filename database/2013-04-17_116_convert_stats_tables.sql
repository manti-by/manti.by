DROP TABLE IF EXISTS `stats_browser`;
CREATE TABLE `stats_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) NOT NULL,
  `version` varchar(64) NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stats_nginx`;
CREATE TABLE `stats_nginx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` text NOT NULL,
  `count` int(11) unsigned NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stats_session`;
CREATE TABLE `stats_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(64) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;