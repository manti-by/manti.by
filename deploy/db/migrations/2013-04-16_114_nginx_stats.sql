DROP TABLE IF EXISTS `stats_nginx`;
CREATE TABLE `stats_nginx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` text NOT NULL,
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
