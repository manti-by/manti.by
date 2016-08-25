-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: manti
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_log`
--

DROP TABLE IF EXISTS `_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=922755 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_sef_alias`
--

DROP TABLE IF EXISTS `_sef_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sef_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_migration`
--

DROP TABLE IF EXISTS `db_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_migration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `source` text NOT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `order` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_relations`
--

DROP TABLE IF EXISTS `files_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_files_relations` (`original_id`,`target_id`) USING BTREE,
  KEY `fk_files_relations_target_id` (`target_id`) USING BTREE,
  KEY `fk_files_relations_original_id` (`original_id`) USING BTREE,
  CONSTRAINT `files_relations_ibfk_1` FOREIGN KEY (`original_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `files_relations_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gallery_files`
--

DROP TABLE IF EXISTS `gallery_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_file` (`gallery_id`,`file_id`) USING BTREE,
  KEY `fk_gallery_files_file_id` (`file_id`) USING BTREE,
  KEY `fk_gallery_files_gallery_id` (`gallery_id`) USING BTREE,
  CONSTRAINT `gallery_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gallery_files_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gallery_tags`
--

DROP TABLE IF EXISTS `gallery_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_gallery_tags_gallery_id` (`gallery_id`) USING BTREE,
  KEY `fk_gallery_tags_tag_id` (`tag_id`) USING BTREE,
  CONSTRAINT `gallery_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gallery_tags_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_files`
--

DROP TABLE IF EXISTS `post_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_post_file` (`post_id`,`file_id`) USING BTREE,
  KEY `fk_post_files_post_id` (`post_id`) USING BTREE,
  KEY `fk_post_files_file_id` (`file_id`) USING BTREE,
  CONSTRAINT `post_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_files_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_relations`
--

DROP TABLE IF EXISTS `post_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_original_to_destination` (`original_id`,`destination_id`) USING BTREE,
  KEY `fk_post_relations_destination_id` (`destination_id`) USING BTREE,
  CONSTRAINT `post_relations_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_relations_ibfk_2` FOREIGN KEY (`original_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_post_tags_post_id` (`post_id`) USING BTREE,
  KEY `fk_post_tags_tag_id` (`tag_id`) USING BTREE,
  CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_browser`
--

DROP TABLE IF EXISTS `stats_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) NOT NULL,
  `version` varchar(64) NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7422 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_nginx`
--

DROP TABLE IF EXISTS `stats_nginx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_nginx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` text NOT NULL,
  `count` int(11) unsigned NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5099 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_session`
--

DROP TABLE IF EXISTS `stats_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(64) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tags_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) unsigned NOT NULL DEFAULT '1000',
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`) USING BTREE,
  KEY `fk_user_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'manti'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(`_source` varchar(255),`_delimiter` varchar(1),`_position` int) RETURNS varchar(255) CHARSET utf8
BEGIN
    RETURN REPLACE (
        SUBSTRING(SUBSTRING_INDEX(_source, _delimiter, _position),
        LENGTH(SUBSTRING_INDEX(_source, _delimiter, _position - 1)) + 1),
       _delimiter, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ALL_POSTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALL_POSTS`()
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS `all_posts`(
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `alias` varchar(64) NOT NULL,
      `name` varchar(255) NOT NULL,
      `teaser` varchar(512) NOT NULL,
      `description` TEXT DEFAULT NULL,
      `metakeys` TEXT DEFAULT NULL,
      `taxonomy` TEXT DEFAULT NULL,
      `metadesc` TEXT DEFAULT NULL,
      `is_music` tinyint(1) DEFAULT '0',
      `catnum` varchar(16) NOT NULL,
      `genre` varchar(32) NOT NULL,
      `length` varchar(16) NOT NULL,
      `quality` varchar(255) NOT NULL,
      `tracklist` TEXT DEFAULT NULL,
      `preview` TEXT DEFAULT NULL,
      `release` TEXT DEFAULT NULL,
      `covers` TEXT DEFAULT NULL,
      `relations` TEXT DEFAULT NULL,
      `created`  datetime DEFAULT NULL,
      `viewed` int(11) unsigned DEFAULT '0',
      `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`)
    ) AS (
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
          SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '", "name":"' , _f.`name`, '"}')), ']')
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
    );END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CHECK_COOKIE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_COOKIE`(IN `_cookie` varchar(32), IN `_secret` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE _cookie = MD5(CONCAT(_secret, `email`))
    LIMIT 0, 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CHECK_EMAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_EMAIL`(IN `_email` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `email` = _email 
    LIMIT 0, 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CHECK_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_LOGIN`(IN `_email` varchar(32), IN `_password` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user`
    WHERE `email` = _email
      AND `password` = _password
    LIMIT 0, 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CHECK_USERNAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_USERNAME`(IN `_username` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `username` = _username
    LIMIT 0, 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CREATE_FILE_RELATIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_FILE_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        
        INSERT INTO `post_files` (`post_id`, `file_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CREATE_POST_RELATIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_POST_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        
        INSERT INTO `post_relations` (`original_id`, `destination_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CREATE_TAGS_RELATIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_TAGS_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        
        INSERT INTO `post_tags` (`post_id`, `tag_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELETE_POST_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_POST_BY_ID`(IN `_id` int)
BEGIN
    DELETE FROM `post`
    WHERE `id` = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_BROWSER_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_BROWSER_STATS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
      SELECT DISTINCT CONCAT(`browser`, ' ', `version`) AS browser, SUM(`count`) AS count
      FROM `stats_browser`
      WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 MONTH
      GROUP BY `browser`, `version`
      ORDER BY count DESC
      LIMIT ?;";SET @rows = _limit;EXECUTE stmt USING @rows;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOWNLOAD_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_DOWNLOAD_STATS`(IN `_limit` int)
BEGIN
    SET @rows = _limit;
    PREPARE stmt FROM "
        SELECT DISTINCT f.`name`, f.`source`, p.`viewed`, f.`viewed` AS downloaded,
            (
                SELECT _f.`viewed`
                FROM `post` _p
                LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
                LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
                WHERE _f.`type` = 'preview'
                  AND _p.`id` = p.`id`
            ) AS previewed,
            sp.`count` AS nginx_viewed, sf.`count` AS nginx_downloaded,
            IFNULL((
								SELECT _s.`count`
								FROM `post` _p
								LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
								LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
								LEFT JOIN `stats_nginx` _s ON _s.`request` = SUBSTRING(_f.`source` FROM 2)
								WHERE _f.`type` = 'preview'
									AND _p.`id` = p.`id`
						), 0) + IFNULL((
								SELECT _s.`count`
								FROM `post` _p
								LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
								LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
								LEFT JOIN `stats_nginx` _s ON _s.`request` = REPLACE(SUBSTRING(_f.`source` FROM 2), '.mp3', '.ogg')
								WHERE _f.`type` = 'preview'
									AND _p.`id` = p.`id`
						), 0) AS nginx_previewed
        FROM `post` p
        LEFT JOIN `post_files` pf ON pf.`post_id` = p.`id`
        LEFT JOIN `files` f ON f.`id` = pf.`file_id`
        LEFT JOIN `stats_nginx` sp ON sp.`request` = CONCAT('/blog/', p.`alias`, '/')
        LEFT JOIN `stats_nginx` sf ON sf.`request` = SUBSTRING(f.`source` FROM 2)
        WHERE f.`type` = 'release'
        ORDER BY p.`viewed` DESC, sp.`count` DESC
        LIMIT ?;";
		EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_FILES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    SET @type = _type;
    SET @rows = _limit;
		
    IF _type <> '' THEN
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				WHERE `type` = ?
				ORDER BY `source`
				LIMIT ?;";

			EXECUTE stmt USING @type, @rows;
    ELSE
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				ORDER BY `source`
				LIMIT ?;";
      
      EXECUTE stmt USING @rows;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GALLERY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
        ORDER BY g.`id` DESC
			  LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
    WHERE g.`id` = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_TAGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS`(IN `_path` varchar(255))
BEGIN
    SELECT *
    FROM `files`
    WHERE `source` LIKE CONCAT('%', _path, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS_BY_ID`(IN `_id` int)
BEGIN
    SELECT f.*
    FROM `files` f
    JOIN `gallery_files` gf ON gf.`file_id` = f.`id`
    WHERE gf.`gallery_id` = _id
    ORDER BY f.`timestamp` DESC, f.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_LATEST_IMAGES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT f.*, g.`gallery_id`
        FROM `files` f
        JOIN `gallery_files` g ON f.`id` = g.`file_id`
        WHERE f.`type` = 'gallery'
        AND g.`gallery_id` <> 13
        ORDER BY f.`order` DESC, f.`timestamp` DESC, f.`id` DESC
        LIMIT ?;";
    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_NEXT_IMAGE_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_NEXT_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;
    DECLARE __count_left INT;

    SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;

		IF __gallery_id = 13 THEN
				CREATE TEMPORARY TABLE IF NOT EXISTS `prev_image` AS (
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`file_id` > _id
							AND gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` ASC, f.`id` ASC
						LIMIT 1
				);

				SELECT COUNT(*)
				INTO __count_left
				FROM `prev_image`;

				IF __count_left > 0 THEN
						SELECT * FROM `prev_image`;
				ELSE
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` ASC, f.`id` ASC
						LIMIT 1;
				END IF;
		ELSE
				CREATE TEMPORARY TABLE IF NOT EXISTS `next_image` AS (
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`file_id` < _id
							AND gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` DESC, f.`id` DESC
						LIMIT 1
				);

				SELECT COUNT(*)
				INTO __count_left
				FROM `next_image`;

				IF __count_left > 0 THEN
						SELECT * FROM `next_image`;
				ELSE
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` DESC, f.`id` DESC
						LIMIT 1;
				END IF;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POPULAR_IMAGES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POPULAR_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT f.*, g.`gallery_id`
        FROM `files` f
        JOIN `gallery_files` g ON f.`id` = g.`file_id`
        WHERE f.`type` = 'gallery'
        ORDER BY f.`viewed` DESC, f.`order` DESC, f.`timestamp` DESC, `id` DESC
        LIMIT ?;";
    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POSTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limitstart` int, IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    PREPARE stmt FROM "
			SELECT p.*
			FROM `all_posts` AS p
			WHERE p.`is_music` > 0
			ORDER BY p.`created` DESC
			LIMIT ?, ?;";

    SET @skip = _limitstart;
    SET @rows = _limit;
    EXECUTE stmt USING @skip, @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    CALL ALL_POSTS();PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
        JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
        WHERE t.`name` IN (?)
        ORDER BY p.`created` DESC
        LIMIT ?;";
		SET @tags = _tags;
		SET @rows = _limit;
		EXECUTE stmt USING @tags, @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAG_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
        LIMIT 0, ?;";SET @id = _id;SET @rows = _limit;EXECUTE stmt USING @id, @rows;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POSTS_BY_VIEW_COUNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_VIEW_COUNT`(IN `_limit` int, IN `_with_covers` tinyint)
BEGIN
		CALL ALL_POSTS();

		IF _with_covers > 0 THEN
		    PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					WHERE `covers` IS NOT NULL
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		ELSE
				PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		END IF;

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POST_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_BY_ID`(IN `_id` int)
BEGIN
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    WHERE p.`id` = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_POST_RELATIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PREV_IMAGE_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_PREV_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;
    DECLARE __count_left INT;

    SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;

		IF __gallery_id = 13 THEN
				CREATE TEMPORARY TABLE IF NOT EXISTS `next_image` AS (
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`file_id` < _id
							AND gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` DESC, f.`id` DESC
						LIMIT 1
				);

				SELECT COUNT(*)
				INTO __count_left
				FROM `next_image`;

				IF __count_left > 0 THEN
						SELECT * FROM `next_image`;
				ELSE
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` DESC, f.`id` DESC
						LIMIT 1;
				END IF;
		ELSE
				CREATE TEMPORARY TABLE IF NOT EXISTS `prev_image` AS (
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`file_id` > _id
							AND gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` ASC, f.`id` ASC
						LIMIT 1
				);

				SELECT COUNT(*)
				INTO __count_left
				FROM `prev_image`;

				IF __count_left > 0 THEN
						SELECT * FROM `prev_image`;
				ELSE
						SELECT f.*
						FROM `gallery_files` gf
						JOIN `files` f ON f.`id` = gf.`file_id`
						WHERE gf.`gallery_id` = __gallery_id
						ORDER BY f.`timestamp` ASC, f.`id` ASC
						LIMIT 1;
				END IF;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_SEF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF`(IN `_link` varchar(255))
BEGIN
    SELECT * 
    FROM `_sef_alias`
    WHERE `link` LIKE _link
       OR `request` LIKE _link;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_SEF_MAP_ALIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF_MAP_ALIAS`(IN `_field` varchar(255), IN `_table` varchar(255), IN `_id` int)
BEGIN
    SET @q = CONCAT('SELECT ', _field, ' FROM ', _table, ' WHERE `id` = ', _id);
		PREPARE stmt FROM @q;
		EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_SESSION_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SESSION_STATS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
      SELECT CONCAT(`country`, ' [', `ip`, ']') AS `visitor`, `count`, `timestamp`
      FROM `stats_session`
      WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 WEEK
        AND `ip` <> '127.0.0.1'
        AND `ip` <> '86.57.158.234'
      ORDER BY `timestamp` ASC
      LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_STATS`(IN `_start_date` timestamp, IN `_end_date` timestamp)
BEGIN
		SELECT *
		FROM `_log`
		WHERE `timestamp` >= _start_date
		  AND `timestamp` <= _end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_TAGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			SELECT t.*, COUNT(pt.`id`) `count`
			FROM `tags` t
			JOIN `post_tags` pt ON pt.`tag_id` = t.`id`
			GROUP BY t.`id`
			ORDER BY `count` DESC
			LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_TAGS_BY_IDS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS_BY_IDS`(IN `_ids` varchar(32))
BEGIN
    SET @sql = CONCAT('SELECT * FROM `tags` WHERE `id` IN (', _ids, ');');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_TAGS_TREE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS_TREE`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			SELECT t.`id`, t.`name`, p.`created`, COUNT(pt.`id`) `count`
			FROM `tags` t
			JOIN `post_tags` pt ON pt.`tag_id` = t.`id`
      JOIN `post` p ON p.`id` = pt.`post_id`
			GROUP BY p.`created`, t.`id`
			ORDER BY t.`name` DESC
			LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_USER_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USER_BY_ID`(IN `_id` int)
BEGIN
    SELECT u.*, g.`name` AS `group` 
    FROM `user` AS u
    JOIN `group` AS g ON g.`id` = u.`group_id`
    WHERE u.`id` = _id
    LIMIT 0, 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMOVE_FILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_FILE`(IN `_id` int)
BEGIN
    SELECT `source` 
    FROM `files` 
    WHERE `id` = _id OR `source` = _id;
    
    DELETE FROM `files` 
    WHERE `id` = _id OR `source` = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCH_GALLERY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
       OR t.`alias` LIKE CONCAT('%', _query, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCH_POST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_POST`(IN `_query` text)
BEGIN
    CALL ALL_POSTS();

    SELECT DISTINCT p.*
    FROM `all_posts` AS p
    LEFT JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
    LEFT JOIN `tags` AS t ON t.`id` = pt.`tag_id`
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
       OR t.`alias` LIKE CONCAT('%', _query, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCH_TAGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_TAGS`(IN `_query` varchar(32))
BEGIN
    SELECT *
    FROM `tags`
    WHERE `name` LIKE _query;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRACK_FILE_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_FILE_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `files`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `files`
    WHERE `id` = _id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRACK_GALLERY_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_GALLERY_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `gallery`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `gallery`
    WHERE `id` = _id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRACK_POST_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_POST_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `post`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `post`
    WHERE `id` = _id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PASSWORD`(IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    UPDATE `user` 
    SET `password` = _password
    WHERE `email` = _email
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_POST_DATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_POST_DATE`()
BEGIN
	  UPDATE `post` AS p
    JOIN `post_files` AS pf ON pf.`post_id` = p.`id`
	  JOIN `files` f ON f.`id` = pf.`file_id`
	  SET p.`created` = f.`timestamp`
	  WHERE p.`is_music` = 1
	    AND f.`type` = 'release';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_SEF_COUNTER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_SEF_COUNTER`(IN `_request` varchar(255),IN `_link` varchar(255))
BEGIN
    UPDATE `_sef_alias`
    SET `viewed` = `viewed` + 1
    WHERE `request` = _request
       OR `link` = _link;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_BROWSER_STAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_BROWSER_STAT`(IN `_browser` varchar(255), IN `_version` varchar(64), IN `_count` int, IN `_timestamp` varchar(64))
BEGIN
    INSERT INTO `stats_browser` (`browser`, `version`, `count`, `timestamp`)
    VALUES (_browser, _version, _count, _timestamp);END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_FILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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

        SELECT __id;
    ELSE
        INSERT INTO `files` (`type`, `name`, `description`, `source`, `size`, `md5`)
        VALUES (_type, _name, _description, _source, _size, _md5);

        SELECT LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_GALLERY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY`(IN `_id` int(10), IN `_path` varchar(255), IN `_name` varchar(255), IN `_alias` varchar(64), IN `_description` text, IN `_metadesc` varchar(255))
BEGIN
    DECLARE __gallery_id INT;

    IF (_id > 0) THEN
        UPDATE `gallery`
        SET `path` = _path, `name` = _name, `alias` = _alias, `description` = _description, `metadesc` = _metadesc
        WHERE `id` = _id;

        SELECT _id AS `result`;
    ELSE
        SELECT `id`
        INTO __gallery_id
        FROM `gallery`
        WHERE `path` = _path;

        IF (__gallery_id > 0) THEN
            SELECT __gallery_id AS `result`;
        ELSE
            INSERT INTO `gallery` (`path`, `name`, `alias`, `description`, `metadesc`)
            VALUES (_path, _name, _alias, _description, _metadesc);

            SELECT LAST_INSERT_ID() AS `result`;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_GALLERY_FILES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY_FILES`(IN `_gallery_id` int, IN `_file_id` int)
BEGIN
    INSERT INTO `gallery_files` (`gallery_id`, `file_id`)
    VALUES (_gallery_id, _file_id);

    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_NGINX_STAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_NGINX_STAT`(IN `_request` text, IN `_count` int)
BEGIN
    DECLARE __id INT;SELECT `id`
    INTO __id
    FROM `stats_nginx`
    WHERE `request` = _request;IF __id > 0 THEN
        UPDATE `stats_nginx`
        SET `count` = `count` + _count
        WHERE `id` = __id;ELSE
        INSERT INTO `stats_nginx` (`request`, `count`)
        VALUES (_request, _count);END IF;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_POST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_POST`(IN `_id` int, IN `_name` varchar(255), IN `_alias` varchar(64), IN `_teaser` varchar(512), IN `_description` text, IN `_metakeys` varchar(255), IN `_metadesc` varchar(255), IN `_is_music` int, IN `_relations` varchar(255), IN `_catnum` varchar(255),  IN `_genre` varchar(255),  IN `_quality` varchar(255),  IN `_length` varchar(255), IN `_tracklist` text,  IN `_attachments` varchar(255))
BEGIN
    DECLARE _post_id INT;
    IF (_id > 0) THEN
        SET _post_id = _id;
    END IF;

    
    DELETE FROM `post_tags` WHERE `post_id` = _post_id;
    DELETE FROM `post_files` WHERE `post_id` = _post_id;
    DELETE FROM `post_relations` WHERE `original_id` = _post_id;

    
    IF (_post_id > 0) THEN
        UPDATE `post`
        SET `name` = _name, `alias` = _alias, `teaser` = _teaser, `description` = _description, `metadesc` = _metadesc,
            `is_music` = _is_music, `catnum`  = _catnum, `genre` = _genre, `quality` = _quality,
            `length` = _length, `tracklist` = _tracklist
        WHERE `id` = _post_id;
    ELSE
        INSERT INTO `post` (`name`, `alias`, `teaser`, `description`, `metadesc`, `is_music`,
             `catnum`, `genre`, `quality`, `length`, `tracklist`, `created`)
        VALUES (_name, _alias, _teaser, _description, _metadesc, _is_music, _catnum, _genre, _quality, _length, _tracklist, NOW());

        SELECT LAST_INSERT_ID() INTO _post_id;
    END IF;

    
    CALL CREATE_TAGS_RELATIONS(_post_id, _metakeys);
    CALL CREATE_FILE_RELATIONS(_post_id, _attachments);
    CALL CREATE_POST_RELATIONS(_post_id, _relations);

    
    SELECT _post_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_SEF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SEF`(IN `_request` varchar(255), IN `_link` varchar(255))
BEGIN
    INSERT INTO `_sef_alias` (`request`,`link`)
    VALUES (_request, _link);

    SELECT LAST_INSERT_ID() AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_SESSION_STAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SESSION_STAT`(IN `_session` varchar(255), IN `_ip` varchar(50), IN `_country` varchar(2), IN `_count` int, IN `_timestamp` varchar(64))
BEGIN
    INSERT INTO `stats_session` (`session`, `ip`, `country`, `count`, `timestamp`)
    VALUES (_session, _ip, _country, _count, _timestamp);END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_TAGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_TAGS`(IN `_tags` varchar(255))
BEGIN
    DECLARE _index INT DEFAULT 0;
    DECLARE _current_id INT DEFAULT 0;
    DECLARE _previous_id INT DEFAULT 0;
    DECLARE _current_value VARCHAR(255);

    
    CREATE TEMPORARY TABLE IF NOT EXISTS `result_set` (
        `id` int NOT NULL,
        `name` varchar(32) NOT NULL
    ) ENGINE = MEMORY;
    TRUNCATE TABLE `result_set`;

    tags_loop: LOOP
        SET _index = _index + 1;
        SET _current_value = SPLIT_STR(_tags, ",", _index);

        IF _current_value = '' THEN
           LEAVE tags_loop;
        END IF;

        
        SELECT `id`
        INTO _current_id
        FROM `tags`
        WHERE `name` = _current_value;

        
        IF (_current_id = _previous_id) THEN
            INSERT INTO `tags` (`name`)
            VALUES (_current_value);
             
            SELECT LAST_INSERT_ID()
            INTO _current_id;
        END IF;

        
        INSERT INTO `result_set` (`id`, `name`)
        VALUES (_current_id, _current_value);

        SET _previous_id = _current_id;
    END LOOP tags_loop;

    
    SELECT *
    FROM `result_set`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPSERT_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_USER`(IN `_id` int, IN `_username` varchar(64), IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    IF (_id > 0) THEN
        UPDATE `user`
        SET `username` = _username, `email` = _email, `password` = _password
        WHERE `id` = __id;

        SELECT __id AS record_id;
    ELSE
        INSERT INTO `user` (`username`, `email`, `password`)
        VALUES (_username, _email, _password);

        SELECT LAST_INSERT_ID() AS record_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-22 10:42:13
