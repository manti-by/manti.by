/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3336
Source Database       : manti_by

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-04-09 15:16:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `db_migration`
-- ----------------------------
DROP TABLE IF EXISTS `db_migration`;
CREATE TABLE `db_migration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of db_migration
-- ----------------------------
INSERT INTO `db_migration` VALUES ('1', '0', null, '2013-04-09 15:14:23');
INSERT INTO `db_migration` VALUES ('2', '1', '1 log and sef tables.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('3', '2', '2 user tables.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('4', '3', '3 blog tables.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('5', '4', '4 add username.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('6', '5', '5 add category alias.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('7', '6', '6 add post fields.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('8', '7', '7 tags table.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('9', '8', '8 new post taxonomy.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('10', '9', '9 files table.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('11', '10', '10 get posts.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('12', '11', '11 get post by id.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('13', '12', '12 get posts by tags.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('14', '13', '13 gallery tables.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('15', '14', '14 get gallery.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('16', '15', '15 get gallery by tags.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('17', '16', '16 get gallery by id.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('18', '17', '17 change filetype.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('19', '18', '18 get files.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('20', '19', '19 post relations.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('21', '20', '20 upsert files.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('22', '21', '21 remove files.sql', '2013-04-09 15:14:24');
INSERT INTO `db_migration` VALUES ('23', '22', '22 add music fields.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('24', '23', '23 user check cookie.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('25', '24', '24 user check email.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('26', '25', '25 user check login.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('27', '26', '26 user check username.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('28', '27', '27 user get by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('29', '28', '28 user update password.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('30', '29', '29 user upsert.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('31', '30', '30 get sef.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('32', '31', '31 get sef map alias.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('33', '32', '32 sef upsert.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('34', '33', '33 update sef counter.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('35', '34', '34 create file relations.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('36', '35', '35 create post relations.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('37', '36', '36 create tags relations.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('38', '37', '37 upsert post.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('39', '38', '38 upsert tags.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('40', '39', '39 split str.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('41', '40', '40 get tags by ids.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('42', '41', '41 search tags.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('43', '42', '42 get posts by tag id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('44', '43', '43 get tags.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('45', '44', '44 all posts.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('46', '45', '45 add date to post.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('47', '46', '46 add dates to tags.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('48', '47', '47 add aliases.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('49', '48', '48 add upsert gallery.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('50', '49', '49 add view counter for posts.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('51', '50', '50 track post by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('52', '51', '51 get posts by view count.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('53', '52', '52 get gallery items.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('54', '53', '53 add view counter for files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('55', '54', '54 track file by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('56', '55', '55 fix get gallery by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('57', '56', '56 add view counter for gallery.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('58', '57', '57 track gallery by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('59', '58', '58 delete post by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('60', '59', '59 add gallery to files link.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('61', '60', '60 add uk for post files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('62', '61', '61 add uk for gallery files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('63', '62', '62 add upsert gallery files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('64', '63', '63 fix dublicates on upsert gallery.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('65', '64', '64 change get gallery items.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('66', '65', '65 get next image by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('67', '66', '66 get prev image by id.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('68', '67', '67 fix tracklist length on post upsert.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('69', '68', '68 add to get tags counter.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('70', '69', '69 hardcode music posts.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('71', '70', '70 add get latest images.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('72', '71', '71 add get popular images.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('73', '72', '72 add timestamp to files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('74', '73', '73 fix gallery items order.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('75', '74', '74 update get next image.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('76', '75', '75 update get prev image.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('77', '76', '76 update get files.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('78', '77', '77 update get latest images.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('79', '78', '78 fix get sef map alias.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('80', '79', '79 search post.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('81', '80', '80 search gallery.sql', '2013-04-09 15:14:25');
INSERT INTO `db_migration` VALUES ('82', '81', '81 extend gallery name.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('83', '82', '82 fix get gallery fields.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('84', '83', '83 update all posts.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('85', '84', '84 update get tags.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('86', '85', '85 update get posts.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('87', '86', '86 update get gallery.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('88', '87', '87 update get posts by tags.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('89', '88', '88 update get posts by view count.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('90', '89', '89 update get latest images.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('91', '90', '90 update get popular images.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('92', '91', '91 update get posts by tag id.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('93', '92', '92 update get files.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('94', '93', '93 update search by tag order.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('95', '94', '94 get stats.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('96', '95', '95 stats tables.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('97', '96', '96 upsert session stats.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('98', '97', '97 get browser chart data.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('99', '98', '98 add ip to session stats.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('100', '99', '99 add ip and country to upsert session stats.sql', '2013-04-09 15:14:26');
INSERT INTO `db_migration` VALUES ('101', '100', '100 get session chart data.sql', '2013-04-09 15:14:26');

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
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
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
  `name` varchar(255) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_alias` (`alias`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery
-- ----------------------------

-- ----------------------------
-- Table structure for `gallery_files`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_files`;
CREATE TABLE `gallery_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_file` (`gallery_id`,`file_id`),
  KEY `fk_gallery_files_file_id` (`file_id`),
  KEY `fk_gallery_files_gallery_id` (`gallery_id`),
  CONSTRAINT `fk_gallery_files_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gallery_files_file_id` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_files
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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'Root');
INSERT INTO `group` VALUES ('10', 'Admin');
INSERT INTO `group` VALUES ('100', 'Moderator');
INSERT INTO `group` VALUES ('1000', 'Registered');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `teaser` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `is_music` tinyint(1) DEFAULT '0',
  `catnum` varchar(16) DEFAULT NULL,
  `genre` varchar(32) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `length` varchar(16) DEFAULT NULL,
  `tracklist` text,
  `created` datetime DEFAULT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_post_alias` (`alias`) USING BTREE
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
  UNIQUE KEY `uk_post_file` (`post_id`,`file_id`),
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
  CONSTRAINT `fk_post_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tags_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `stats_browser`
-- ----------------------------
DROP TABLE IF EXISTS `stats_browser`;
CREATE TABLE `stats_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stats_browser
-- ----------------------------

-- ----------------------------
-- Table structure for `stats_session`
-- ----------------------------
DROP TABLE IF EXISTS `stats_session`;
CREATE TABLE `stats_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(64) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stats_session
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tags_alias` (`alias`) USING BTREE
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
  `group_id` int(11) unsigned NOT NULL DEFAULT '1000',
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `fk_user_group_id` (`group_id`),
  CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'marco.manti@gmail.com', '556db711d3e515b9ee0470beeb6034e8', '2012-02-01 18:37:24', '1', null);

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
-- Procedure structure for `ALL_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ALL_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALL_POSTS`()
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS `all_posts` AS (
        SELECT p.`id`, p.`alias`, p.`name`, p.`teaser`, p.`description`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_t.`id`, ',"name":"', _t.`name`, '"}')), ']')
                FROM `post_tags` AS _pt 
                JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
                WHERE _pt.`post_id` = p.`id`
                  AND _pt.`type` = 'meta'
            ) AS `metakeys`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_t.`id`, ',"name":"', _t.`name`, '"}')), ']')
                FROM `post_tags` AS _pt 
                JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
                WHERE _pt.`post_id` = p.`id`
                  AND _pt.`type` = 'taxonomy'
            ) AS `taxonomy`,
            p.`metadesc`,
            p.`is_music`, p.`catnum`, p.`genre`, p.`length`, p.`quality`, p.`tracklist`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'preview'
            ) AS `preview`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'release'
            ) AS `release`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'covers'
            ) AS `covers`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_p.`id`, ',"name":"', _p.`name`, '","source":"', _f.`source`, '"}')), ']')
                FROM `post_relations` AS _pr
                JOIN `post` AS _p ON _p.`id` = _pr.`destination_id`
                JOIN `post_files` AS _pf ON _pf.`post_id` = _p.`id`
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id`
                WHERE _pr.`original_id` = p.`id`
                  AND _f.`type` = 'covers'
            ) AS `relations`
            , p.`created`, p.`viewed`, p.`timestamp`
        FROM `post` AS p
    );END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_COOKIE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_COOKIE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_COOKIE`(IN `_cookie` varchar(32), IN `_secret` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE _cookie = MD5(CONCAT(_secret, `email`))
    LIMIT 0, 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_EMAIL`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_EMAIL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_EMAIL`(IN `_email` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `email` = _email 
    LIMIT 0, 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_LOGIN`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_LOGIN`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_LOGIN`(IN `_email` varchar(32), IN `_password` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user`
    WHERE `email` = _email
      AND `password` = _password
    LIMIT 0, 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_USERNAME`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_USERNAME`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_USERNAME`(IN `_username` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `username` = _username
    LIMIT 0, 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_FILE_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_FILE_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_FILE_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;DECLARE _current VARCHAR(255);default_loop: LOOP
        SET _index = _index + 1;SET _current = SPLIT_STR(_ids, ",", _index);SELECT _current;IF _current = '' THEN
            LEAVE default_loop;END IF;INSERT INTO `post_files` (`post_id`, `file_id`)
        VALUES (_post_id, _current);END LOOP default_loop;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_POST_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_POST_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_POST_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;DECLARE _current VARCHAR(255);default_loop: LOOP
        SET _index = _index + 1;SET _current = SPLIT_STR(_ids, ",", _index);SELECT _current;IF _current = '' THEN
            LEAVE default_loop;END IF;INSERT INTO `post_relations` (`original_id`, `destination_id`)
        VALUES (_post_id, _current);END LOOP default_loop;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_TAGS_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_TAGS_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_TAGS_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;DECLARE _current VARCHAR(255);default_loop: LOOP
        SET _index = _index + 1;SET _current = SPLIT_STR(_ids, ",", _index);SELECT _current;IF _current = '' THEN
            LEAVE default_loop;END IF;INSERT INTO `post_tags` (`post_id`, `tag_id`)
        VALUES (_post_id, _current);END LOOP default_loop;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `DELETE_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `DELETE_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_POST_BY_ID`(IN `_id` int)
BEGIN
    DELETE FROM `post`
    WHERE `id` = _id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_BROWSER_STATS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_BROWSER_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_BROWSER_STATS`()
BEGIN
		SELECT DISTINCT CONCAT(`browser`, ' ', `version`) AS browser, SUM(`count`) AS count
		FROM `stats_browser`
		WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 MONTH
    GROUP BY `browser`, `version`
    ORDER BY count DESC
    LIMIT 7;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    IF _type <> '' THEN
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				WHERE `type` = _type
				ORDER BY `source`
				LIMIT ?;";ELSE
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				ORDER BY `source`
				LIMIT ?;";END IF;SET @rows = _limit;EXECUTE stmt USING @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
		    SELECT g.`id`, g.`path`, g.`name`, g.`alias`, g.`description`, g.`metadesc`, g.`timestamp`,
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
					) AS `taxonomy`
			  FROM `gallery` AS g
			  LIMIT ?;";SET @rows = _limit;EXECUTE stmt USING @rows;END
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
    WHERE g.`id` = _id;END
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
    LIMIT _limit;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_ITEMS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS`(IN `_path` varchar(255))
BEGIN
    SELECT *
    FROM `files`
    WHERE `source` LIKE CONCAT('%', _path, '%');END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_ITEMS_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS_BY_ID`(IN `_id` int)
BEGIN
    SELECT f.*
    FROM `files` f
    JOIN `gallery_files` gf ON gf.`file_id` = f.`id`
    WHERE gf.`gallery_id` = _id
    ORDER BY f.`timestamp` DESC, f.`id` DESC;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_LATEST_IMAGES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_LATEST_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT *
        FROM `files`
        WHERE `type` = 'gallery'
        ORDER BY `timestamp` DESC, `id` DESC
        LIMIT ?;";SET @rows = _limit;EXECUTE stmt USING @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_NEXT_IMAGE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_NEXT_IMAGE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_NEXT_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;DECLARE __count_left INT;SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;CREATE TEMPORARY TABLE IF NOT EXISTS `next_image` AS (
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`file_id` < _id
          AND gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` DESC, f.`id` DESC
        LIMIT 1
    );SELECT COUNT(*)
    INTO __count_left
    FROM `next_image`;IF __count_left > 0 THEN
        SELECT * FROM `next_image`;ELSE
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` DESC, f.`id` DESC
        LIMIT 1;END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POPULAR_IMAGES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POPULAR_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POPULAR_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT *
        FROM `files`
        WHERE `type` = 'gallery'
        ORDER BY `viewed` DESC
        LIMIT ?;";SET @rows = _limit;EXECUTE stmt USING @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limitstart` int, IN `_limit` int)
BEGIN
    CALL ALL_POSTS();PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        WHERE p.`is_music` = 1
        ORDER BY p.`created` DESC
        LIMIT ?, ?;";SET @skip = _limitstart;SET @rows = _limit;EXECUTE stmt USING @skip, @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    CALL ALL_POSTS();PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
        JOIN `tags` AS t ON t.`id` = pt.`tag_id`
        WHERE t.`name` IN (?)
        ORDER BY p.`viewed` DESC
        LIMIT ?;";SET @tags = _tags;SET @rows = _limit;EXECUTE stmt USING @tags, @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAG_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAG_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAG_ID`(IN `_id` int, IN `_limit` int)
BEGIN
		CALL ALL_POSTS();PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
        JOIN `tags` AS t ON t.`id` = pt.`tag_id`
        WHERE t.`id` = ?
        ORDER BY p.`created` DESC
        LIMIT 0, ?;";SET @id = _id;SET @rows = _limit;EXECUTE stmt USING @id, @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_VIEW_COUNT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_VIEW_COUNT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_VIEW_COUNT`(IN `_limit` int, IN `_with_covers` tinyint)
BEGIN
		CALL ALL_POSTS();IF _with_covers > 0 THEN
		    PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					WHERE `covers` IS NOT NULL
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";ELSE
				PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";END IF;SET @rows = _limit;EXECUTE stmt USING @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_BY_ID`(IN `_id` int)
BEGIN
    CALL ALL_POSTS();SELECT p.*
    FROM `all_posts` AS p
    WHERE p.`id` = _id;END
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
        WHERE pr.`original_id` = _id;ELSE
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post` AS p;END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_PREV_IMAGE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_PREV_IMAGE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_PREV_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;DECLARE __count_left INT;SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;CREATE TEMPORARY TABLE IF NOT EXISTS `prev_image` AS (
      SELECT f.*
      FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
      WHERE gf.`file_id` > _id
            AND gf.`gallery_id` = __gallery_id
      ORDER BY f.`timestamp` ASC, f.`id` ASC
      LIMIT 1
    );SELECT COUNT(*)
    INTO __count_left
    FROM `prev_image`;IF __count_left > 0 THEN
      SELECT * FROM `prev_image`;ELSE
      SELECT f.*
      FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
      WHERE gf.`gallery_id` = __gallery_id
      ORDER BY f.`timestamp` ASC, f.`id` ASC
      LIMIT 1;END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SEF`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SEF`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF`(IN `_link` varchar(255))
BEGIN
    SELECT * 
    FROM `_sef_alias`
    WHERE `link` LIKE _link
       OR `request` LIKE _link;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SEF_MAP_ALIAS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SEF_MAP_ALIAS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF_MAP_ALIAS`(IN `_field` varchar(255), IN `_table` varchar(255), IN `_id` int)
BEGIN
    SET @q = CONCAT('SELECT ', _field, ' FROM ', _table, ' WHERE `id` = ', _id);PREPARE stmt FROM @q;EXECUTE stmt;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SESSION_STATS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SESSION_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SESSION_STATS`()
BEGIN
    SELECT CONCAT(`country`, ' [', `ip`, ']') AS `visitor`, `count`, `timestamp`
    FROM `stats_session`
    WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 WEEK
      AND `ip` <> '127.0.0.1'
    ORDER BY `timestamp` ASC;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_STATS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_STATS`(IN `_start_date` timestamp, IN `_end_date` timestamp)
BEGIN
		SELECT *
		FROM `_log`
		WHERE `timestamp` >= _start_date
		  AND `timestamp` <= _end_date;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			  SELECT t.*, COUNT(pt.`id`) `count`
			  FROM `tags` t
			  JOIN `post_tags` pt ON pt.`tag_id` = t.`id`
			  GROUP BY t.`id`
			  ORDER BY `count` DESC
			  LIMIT ?;";SET @rows = _limit;EXECUTE stmt USING @rows;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS_BY_IDS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS_BY_IDS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS_BY_IDS`(IN `_ids` varchar(32))
BEGIN
    SET @sql = CONCAT('SELECT * FROM `tags` WHERE `id` IN (', _ids, ');');PREPARE stmt FROM @sql;EXECUTE stmt;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_USER_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_USER_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USER_BY_ID`(IN `_id` int)
BEGIN
    SELECT u.*, g.`name` AS `group` 
    FROM `user` AS u
    JOIN `group` AS g ON g.`id` = u.`group_id`
    WHERE u.`id` = _id
    LIMIT 0, 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `REMOVE_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `REMOVE_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_FILE`(IN `_id` int)
BEGIN
    SELECT `source` 
    FROM `files` 
    WHERE `id` = _id OR `source` = _id;DELETE FROM `files` 
    WHERE `id` = _id OR `source` = _id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_GALLERY`(IN `_query` text)
BEGIN
  SELECT DISTINCT g.`id`, g.`path`, g.`name`, g.`alias`, g.`description`, g.`metadesc`, g.`timestamp`,
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
      ) AS `taxonomy`
  FROM `gallery` AS g
  LEFT JOIN `gallery_tags` AS gt ON gt.`gallery_id` = g.`id`
  LEFT JOIN `tags` AS t ON t.`id` = gt.`tag_id`
  WHERE g.`name` LIKE CONCAT('%', _query, '%')
     OR g.`alias` LIKE CONCAT('%', _query, '%')
     OR g.`description` LIKE CONCAT('%', _query, '%')
     OR g.`metadesc` LIKE CONCAT('%', _query, '%')
     OR t.`name` LIKE CONCAT('%', _query, '%')
     OR t.`alias` LIKE CONCAT('%', _query, '%');END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_POST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_POST`(IN `_query` text)
BEGIN
  CALL ALL_POSTS();SELECT DISTINCT p.*
  FROM `all_posts` AS p
  LEFT JOIN `post_tags` pt ON pt.`post_id` = p.`id`
  LEFT JOIN `tags` t ON t.`id` = pt.`tag_id`
  WHERE p.`name` LIKE CONCAT('%', _query, '%')
     OR p.`alias` LIKE CONCAT('%', _query, '%')
     OR p.`teaser` LIKE CONCAT('%', _query, '%')
     OR p.`description` LIKE CONCAT('%', _query, '%')
     OR p.`metadesc` LIKE CONCAT('%', _query, '%')
     OR p.`catnum` LIKE CONCAT('%', _query, '%')
     OR p.`genre` LIKE CONCAT('%', _query, '%')
     OR p.`quality` LIKE CONCAT('%', _query, '%')
     OR p.`length` LIKE CONCAT('%', _query, '%')
     OR p.`tracklist` LIKE CONCAT('%', _query, '%')
     OR t.`name` LIKE CONCAT('%', _query, '%')
     OR t.`alias` LIKE CONCAT('%', _query, '%');END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_TAGS`(IN `_query` varchar(32))
BEGIN
    SELECT *
    FROM `tags`
    WHERE `name` LIKE _query;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_FILE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_FILE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_FILE_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `files`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;SELECT `viewed`
    FROM `files`
    WHERE `id` = _id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_GALLERY_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_GALLERY_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_GALLERY_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `gallery`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;SELECT `viewed`
    FROM `gallery`
    WHERE `id` = _id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_POST_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `post`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;SELECT `viewed`
    FROM `post`
    WHERE `id` = _id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPDATE_PASSWORD`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPDATE_PASSWORD`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PASSWORD`(IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    UPDATE `user` 
    SET `password` = _password
    WHERE `email` = _email
    LIMIT 1;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPDATE_SEF_COUNTER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPDATE_SEF_COUNTER`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_SEF_COUNTER`(IN `_request` varchar(255),IN `_link` varchar(255))
BEGIN
    UPDATE `_sef_alias`
    SET `viewed` = `viewed` + 1
    WHERE `request` = _request
       OR `link` = _link;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_FILE`(IN `_type` varchar(32), IN `_name` varchar(255), IN `_description` text, IN `_source` text, IN `_size` int,IN `_md5` varchar(32))
BEGIN
    DECLARE __id INT;SELECT `id`
    INTO __id
    FROM `files`
    WHERE `md5` = _md5 AND `source` = _source;IF (__id > 0) THEN
        UPDATE `files`
        SET `type` = _type, `name` = _name, `description` = _description, `size` = _size
        WHERE `id` = __id;SELECT __id;ELSE
        INSERT INTO `files` (`type`, `name`, `description`, `source`, `size`, `md5`)
        VALUES (_type, _name, _description, _source, _size, _md5);SELECT LAST_INSERT_ID();END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY`(IN `_id` int(10), IN `_path` varchar(255), IN `_name` varchar(255), IN `_alias` varchar(64), IN `_description` text, IN `_metadesc` varchar(255))
BEGIN
    DECLARE __gallery_id INT;IF (_id > 0) THEN
        UPDATE `gallery`
        SET `path` = _path, `name` = _name, `alias` = _alias, `description` = _description, `metadesc` = _metadesc
        WHERE `id` = _id;SELECT _id AS `result`;ELSE
        SELECT `id`
        INTO __gallery_id
        FROM `gallery`
        WHERE `path` = _path;IF (__gallery_id > 0) THEN
            SELECT __gallery_id AS `result`;ELSE
            INSERT INTO `gallery` (`path`, `name`, `alias`, `description`, `metadesc`)
            VALUES (_path, _name, _alias, _description, _metadesc);SELECT LAST_INSERT_ID() AS `result`;END IF;END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_GALLERY_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_GALLERY_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY_FILES`(IN `_gallery_id` int, IN `_file_id` int)
BEGIN
    INSERT INTO `gallery_files` (`gallery_id`, `file_id`)
    VALUES (_gallery_id, _file_id);SELECT LAST_INSERT_ID();END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_POST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_POST`(IN `_id` int, IN `_name` varchar(255), IN `_alias` varchar(64), IN `_teaser` varchar(512), IN `_description` text, IN `_metakeys` varchar(255), IN `_metadesc` varchar(255), IN `_is_music` int, IN `_relations` varchar(255), IN `_catnum` varchar(255),  IN `_genre` varchar(255),  IN `_quality` varchar(255),  IN `_length` varchar(255), IN `_tracklist` text,  IN `_attachments` varchar(255))
BEGIN
    DECLARE _post_id INT;IF (_id > 0) THEN
        SET _post_id = _id;END IF;DELETE FROM `post_tags` WHERE `post_id` = _post_id;DELETE FROM `post_files` WHERE `post_id` = _post_id;DELETE FROM `post_relations` WHERE `original_id` = _post_id;IF (_post_id > 0) THEN
        UPDATE `post`
        SET `name` = _name, `alias` = _alias, `teaser` = _teaser, `description` = _description, `metadesc` = _metadesc,
            `is_music` = _is_music, `catnum`  = _catnum, `genre` = _genre, `quality` = _quality,
            `length` = _length, `tracklist` = _tracklist
        WHERE `id` = _post_id;ELSE
        INSERT INTO `post` (`name`, `alias`, `teaser`, `description`, `metadesc`, `is_music`,
             `catnum`, `genre`, `quality`, `length`, `tracklist`, `created`)
        VALUES (_name, _alias, _teaser, _description, _metadesc, _is_music, _catnum, _genre, _quality, _length, _tracklist, NOW());SELECT LAST_INSERT_ID() INTO _post_id;END IF;CALL CREATE_TAGS_RELATIONS(_post_id, _metakeys);CALL CREATE_FILE_RELATIONS(_post_id, _attachments);CALL CREATE_POST_RELATIONS(_post_id, _relations);SELECT _post_id;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_SEF`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_SEF`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SEF`(IN `_request` varchar(255), IN `_link` varchar(255))
BEGIN
    INSERT INTO `_sef_alias` (`request`,`link`)
    VALUES (_request, _link);SELECT LAST_INSERT_ID() AS result;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_SESSION_STAT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_SESSION_STAT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SESSION_STAT`(IN `_session` varchar(255), IN `_ip` varchar(50), IN `_country` varchar(2), IN `_count` int)
BEGIN
    INSERT INTO `stats_session` (`session`, `ip`, `country`, `count`)
    VALUES (_session, _ip, _country, _count);END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_TAGS`(IN `_tags` varchar(255))
BEGIN
    DECLARE _index INT DEFAULT 0;DECLARE _current_id INT DEFAULT 0;DECLARE _previous_id INT DEFAULT 0;DECLARE _current_value VARCHAR(255);CREATE TEMPORARY TABLE IF NOT EXISTS `result_set` (
        `id` int NOT NULL,
        `name` varchar(32) NOT NULL
    ) ENGINE = MEMORY;TRUNCATE TABLE `result_set`;tags_loop: LOOP
        SET _index = _index + 1;SET _current_value = SPLIT_STR(_tags, ",", _index);IF _current_value = '' THEN
           LEAVE tags_loop;END IF;SELECT `id`
        INTO _current_id
        FROM `tags`
        WHERE `name` = _current_value;IF (_current_id = _previous_id) THEN
            INSERT INTO `tags` (`name`)
            VALUES (_current_value);SELECT LAST_INSERT_ID()
            INTO _current_id;END IF;INSERT INTO `result_set` (`id`, `name`)
        VALUES (_current_id, _current_value);SET _previous_id = _current_id;END LOOP tags_loop;SELECT *
    FROM `result_set`;END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_USER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_USER`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_USER`(IN `_id` int, IN `_username` varchar(64), IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    IF (_id > 0) THEN
        UPDATE `user`
        SET `username` = _username, `email` = _email, `password` = _password
        WHERE `id` = __id;SELECT __id AS record_id;ELSE
        INSERT INTO `user` (`username`, `email`, `password`)
        VALUES (_username, _email, _password);SELECT LAST_INSERT_ID() AS record_id;END IF;END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `SPLIT_STR`
-- ----------------------------
DROP FUNCTION IF EXISTS `SPLIT_STR`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(`_source` varchar(255),`_delimiter` varchar(1),`_position` int) RETURNS varchar(255) CHARSET utf8
BEGIN
    RETURN REPLACE (
        SUBSTRING(SUBSTRING_INDEX(_source, _delimiter, _position),
        LENGTH(SUBSTRING_INDEX(_source, _delimiter, _position - 1)) + 1),
       _delimiter, '');END
;;
DELIMITER ;
