/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3336
Source Database       : niiar

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2012-10-12 15:59:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `source` text NOT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `md5` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for `gallery`
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery
-- ----------------------------

-- ----------------------------
-- Table structure for `gallery_tags`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_tags`;
CREATE TABLE `gallery_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_gallery_tags_gallery_id` (`gallery_id`),
  KEY `fk_gallery_tags_tag_id` (`tag_id`),
  CONSTRAINT `fk_gallery_tags_gallery_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gallery_tags_tag_id` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'Root');
INSERT INTO `group` VALUES ('2', 'Admin');
INSERT INTO `group` VALUES ('3', 'Moderator');
INSERT INTO `group` VALUES ('4', 'Registered');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `teaser` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `post_files`
-- ----------------------------
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

-- ----------------------------
-- Records of post_files
-- ----------------------------

-- ----------------------------
-- Table structure for `post_relations`
-- ----------------------------
DROP TABLE IF EXISTS `post_relations`;
CREATE TABLE `post_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_original_to_destination` (`original_id`,`destination_id`),
  KEY `fk_post_relations_destination_id` (`destination_id`),
  CONSTRAINT `fk_post_relations_destination_id` FOREIGN KEY (`destination_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_relations_original_id` FOREIGN KEY (`original_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_relations
-- ----------------------------

-- ----------------------------
-- Table structure for `post_tags`
-- ----------------------------
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_post_tags_post_id` (`post_id`),
  KEY `fk_post_tags_tag_id` (`tag_id`),
  CONSTRAINT `fk_post_tags_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) unsigned NOT NULL DEFAULT '4',
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `fk_user_group_id` (`group_id`),
  CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'marco.manti@gmail.com', '29dcc7d516b248c7fceb80cbafa71baa', '2012-10-10 19:54:32', '1', 'Admin');

-- ----------------------------
-- Table structure for `_log`
-- ----------------------------
DROP TABLE IF EXISTS `_log`;
CREATE TABLE `_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `task` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `referer` varchar(500) DEFAULT NULL,
  `sessionid` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ik_browser` (`browser`) USING BTREE,
  KEY `ik_module` (`module`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _log
-- ----------------------------

-- ----------------------------
-- Table structure for `_sef_alias`
-- ----------------------------
DROP TABLE IF EXISTS `_sef_alias`;
CREATE TABLE `_sef_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _sef_alias
-- ----------------------------

-- ----------------------------
-- Procedure structure for `GET_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    IF (_type <> '') THEN
		    SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
		    FROM `files`
		    WHERE `type` = _type
        LIMIT _limit;
    ELSE
		    SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
		    FROM `files`
        LIMIT _limit;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY`(IN `_limit` int)
BEGIN
    SELECT g.`id`, g.`path`, g.`name`, g.`description`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        g.`metadesc`
    FROM `gallery` AS g
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_BY_ID`(IN `_id` int)
BEGIN
    SELECT g.`id`, g.`path`, g.`name`, g.`description`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = p.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = p.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        g.`metadesc`
    FROM `gallery` AS g
    WHERE g.`id` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    SELECT g.`id`, g.`path`, g.`name`, g.`description`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = p.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        g.`metadesc`
    FROM `gallery` AS p
    JOIN `gallery_tags` AS gt ON gt.`gallery_id` = g.`id`
    JOIN `tags` AS t ON t.`id` = gt.`tag_id`
    WHERE t.`name` IN (_tags)
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limit` int)
BEGIN
    SELECT p.`id`, p.`name`, p.`teaser`, p.`description`, p.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _f.`id`, _f.`name`, _f.`source`))
            FROM `post_files` AS _pf 
            JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
            WHERE _pf.`post_id` = p.`id`
        ) AS `files`,
        p.`metadesc`
    FROM `post` AS p
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_BY_ID`(IN `_id` int)
BEGIN
    SELECT p.`id`, p.`name`, p.`teaser`, p.`description`, p.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _f.`id`, _f.`name`, _f.`source`))
            FROM `post_files` AS _pf 
            JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
            WHERE _pf.`post_id` = p.`id`
        ) AS `files`,
        p.`metadesc`
    FROM `post` AS p
    WHERE p.`id` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    SELECT p.`id`, p.`name`, p.`teaser`, p.`description`, p.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `post_tags` AS _pt 
            JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
            WHERE _pt.`post_id` = p.`id`
              AND _pt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _f.`id`, _f.`name`, _f.`source`))
            FROM `post_files` AS _pf 
            JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
            WHERE _pf.`post_id` = p.`id`
        ) AS `files`,
        p.`metadesc`
    FROM `post` AS p
    JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
    JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
    WHERE t.`name` IN (_tags)
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_RELATIONS`(IN `_id` int)
BEGIN
    IF (_id > 0) THEN
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post_relations` AS pr
        LEFT JOIN `post` AS p ON p.`id` = pr.`destination_id`
        WHERE pr.`original_id` = _id;
    ELSE
        SELECT p.`id` AS `id`, p.`name` AS `name`
				FROM `post` AS p;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `REMOVE_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `REMOVE_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_FILE`(IN `_id` varchar(255))
BEGIN
    SELECT `source` 
    FROM `files` 
    WHERE `id` = _id OR `source` = _id;
    
    DELETE FROM `files` 
    WHERE `id` = _id OR `source` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_FILE`(IN `_type` varchar(32), IN `_name` varchar(255), IN `_description` text, IN `_source` text, IN `_size` int,IN `_md5` varchar(32))
BEGIN
    DECLARE __id INT;

    SELECT `id`
    INTO __id
    FROM `files`
    WHERE `md5` = _md5 AND `source` = _source;

    IF (__id > 0) THEN
        UPDATE `files`
        SET `type` = _type, `name` = _name, `description` = _description, `size` = _size
        WHERE `id` = __id;
    ELSE
        INSERT INTO `files` (`type`, `name`, `description`, `source`, `size`, `md5`)
				VALUES (_type, _name, _description, _source, _size, _md5);
    END IF;

    SELECT LAST_INSERT_ID() AS record_id;
END
;;
DELIMITER ;
