SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `group` VALUES ('1', 'Root');
INSERT INTO `group` VALUES ('2', 'Admin');
INSERT INTO `group` VALUES ('3', 'Moderator');
INSERT INTO `group` VALUES ('4', 'Registered');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) unsigned NOT NULL DEFAULT 4,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `fk_user_group_id` (`group_id`),
  CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` VALUES ('1', 'marco.manti@gmail.com', '556db711d3e515b9ee0470beeb6034e8', '2012-02-01 18:37:24', '1');

SET FOREIGN_KEY_CHECKS=1;