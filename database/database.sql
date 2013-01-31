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
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `path` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_path` (`path`) USING BTREE,
  UNIQUE KEY `uk_gallery_alias` (`alias`) USING BTREE
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
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'Root');
INSERT INTO `group` VALUES ('10', 'Admin');
INSERT INTO `group` VALUES ('1000', 'Moderator');
INSERT INTO `group` VALUES ('10000', 'Registered');

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
  KEY `fk_post_files_post_id` (`post_id`),
  KEY `fk_post_files_file_id` (`file_id`),
  CONSTRAINT `fk_post_files_file_id` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_files_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `alias` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `group_id` int(11) unsigned DEFAULT '10000',
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `fk_user_group_id` (`group_id`),
  CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'Admin', 'marco.manti@gmail.com', 'fbf2e79ab28097b5464e8a91ef511260', '2013-01-25 13:02:15');

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
        SELECT p.`id`, p.`name`, p.`teaser`, p.`description`, 
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
            , p.`created`, p.`timestamp`
        FROM `post` AS p
    );
END
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
    LIMIT 0, 1;
END
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
    LIMIT 0, 1;
END
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
    LIMIT 0, 1;
END
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
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_FILE_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_FILE_RELATIONS`;
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

        # Do Inserts
        INSERT INTO `post_files` (`post_id`, `file_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_POST_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_POST_RELATIONS`;
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

        # Do Inserts
        INSERT INTO `post_relations` (`original_id`, `destination_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_TAGS_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_TAGS_RELATIONS`;
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

        # Do Inserts
        INSERT INTO `post_tags` (`post_id`, `tag_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    IF (_type <> '') THEN
        IF (_limit > 0) THEN
            SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
            FROM `files`
            WHERE `type` = _type
            LIMIT _limit;
        ELSE
            SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
            FROM `files`
            WHERE `type` = _type;
        END IF;
    ELSE
        IF (_limit > 0) THEN
            SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
            FROM `files`
            LIMIT _limit;
        ELSE
            SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
            FROM `files`;
        END IF;
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
-- Procedure structure for `GET_GALLERY_ITEMS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS`(IN `_path` varchar(255))
BEGIN
    SELECT *
    FROM `files`
    WHERE `source` LIKE CONCAT('%', _path, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limitstart` int,IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    ORDER BY p.`created` DESC
    LIMIT _limitstart, _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
    JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
    WHERE t.`name` IN (_tags)
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAG_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAG_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAG_ID`(IN `_id` int, IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
    JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
    WHERE t.`id` = _id
    LIMIT 0, _limit;
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
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    WHERE p.`id` = _id;
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
    SELECT p.`id` AS `id`, p.`name` AS `name`
    FROM `post_relations` AS pr
    LEFT JOIN `post` AS p ON p.`id` = pr.`destination_id`
    WHERE pr.`original_id` = _id;
END
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
       OR `request` LIKE _link;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SEF_MAP_ALIAS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SEF_MAP_ALIAS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF_MAP_ALIAS`(IN `_field` varchar(255), IN `_table` varchar(255), IN `_id` int)
BEGIN
    SET @_query = CONCAT('SELECT `', _field, '` FROM `', _table, '` WHERE `id` = ?');
    PREPARE stmt FROM @_query;
    SET @_identifier = _id;
    EXECUTE stmt USING @_identifier;
    DEALLOCATE PREPARE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS`(IN `_limit` int)
BEGIN
    SELECT t.`id`, t.`name`, COUNT(pt.`id`) AS `count`
    FROM `tags` AS t
    JOIN `post_tags` AS pt ON pt.`tag_id` = t.`id`
    GROUP BY t.`name`
    ORDER BY `count` DESC
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS_BY_IDS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS_BY_IDS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS_BY_IDS`(IN `_ids` varchar(32))
BEGIN
    SET @sql = CONCAT('SELECT * FROM `tags` WHERE `id` IN (', _ids, ');');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
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
    LIMIT 0, 1;
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
-- Procedure structure for `SEARCH_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_TAGS`(IN `_query` varchar(32))
BEGIN
    SELECT *
    FROM `tags`
    WHERE `name` LIKE _query;
END
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
    LIMIT 1;
END
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
       OR `link` = _link;
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

        SELECT __id AS `result`;
    ELSE
        INSERT INTO `files` (`type`, `name`, `description`, `source`, `size`, `md5`)
        VALUES (_type, _name, _description, _source, _size, _md5);

        SELECT LAST_INSERT_ID() AS `result`;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY`(IN `_id` int(10), IN `_path` varchar(255), IN `_name` varchar(255), IN `_alias` varchar(64), IN `_description` text, IN `_metadesc` varchar(255))
BEGIN
    IF (_id > 0) THEN
        UPDATE `gallery`
        SET `path` = _path, `name` = _name, `alias` = _alias, `description` = _description, `metadesc` = _metadesc
        WHERE `id` = _id;

        SELECT _id AS `result`;
    ELSE
        INSERT INTO `gallery` (`path`, `name`, `alias`, `description`, `metadesc`)
        VALUES (_path, _name, _alias, _description, _metadesc);

        SELECT LAST_INSERT_ID() AS `result`;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_LOG`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_LOG`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_LOG`(IN `_name` varchar(255),IN `_description` text)
BEGIN
    INSERT INTO `_mysql` (`name`, `value`)
    VALUES (_name, _description);

    SELECT LAST_INSERT_ID() AS `result`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_POST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_POST`(IN `_id` int,IN `_name` varchar(255), IN `_teaser` varchar(512), IN `_description` text, IN `_metakeys` varchar(255), IN `_metadesc` varchar(255), IN `_is_music` int, IN `_relations` varchar(255), IN `_catnum` varchar(255),  IN `_genre` varchar(255),  IN `_quality` varchar(255),  IN `_length` varchar(255), IN `_tracklist` text,  IN `_attachments` varchar(255))
BEGIN
    DECLARE _post_id INT;
    IF (_id > 0) THEN
        SET _post_id = _id;
    END IF;

    # Remove old tags, files and relations
    DELETE FROM `post_tags` WHERE `post_id` = _post_id;
    DELETE FROM `post_files` WHERE `post_id` = _post_id;
    DELETE FROM `post_relations` WHERE `original_id` = _post_id;

    # Upsert post data
    IF (_post_id > 0) THEN
        UPDATE `post`
        SET `name` = _name, `teaser` = _teaser, `description` = _description, `metadesc` = _metadesc,
            `is_music` = _is_music, `catnum`  = _catnum, `genre` = _genre, `quality` = _quality,
            `length` = _length, `tracklist` = _tracklist
        WHERE `id` = _post_id;
    ELSE
        INSERT INTO `post` (`name`, `teaser`, `description`, `metadesc`, `is_music`,
             `catnum`, `genre`, `quality`, `length`, `tracklist`, `created`)
        VALUES (_name, _teaser, _description, _metadesc, _is_music, _catnum, _genre, _quality, _length, _tracklist, NOW());

        SELECT LAST_INSERT_ID() INTO _post_id;
    END IF;

    # Create tags, files and relations
    CALL CREATE_TAGS_RELATIONS(_post_id, _metakeys);
    CALL CREATE_FILE_RELATIONS(_post_id, _attachments);
    CALL CREATE_POST_RELATIONS(_post_id, _relations);

    # Return post IDENTIFIED
    SELECT _post_id AS `result`;
END
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
    VALUES (_request, _link);

    SELECT LAST_INSERT_ID() AS `result`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_TAGS`(IN `_tags` varchar(255))
BEGIN
    DECLARE _index INT DEFAULT 0;
    DECLARE _current_id INT DEFAULT 0;
    DECLARE _previous_id INT DEFAULT 0;
    DECLARE _current_value VARCHAR(255);

    # Result set
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

        # Do existing tag
        SELECT `id`
        INTO _current_id
        FROM `tags`
        WHERE `name` = _current_value;

        # If not exists
        IF (_current_id = _previous_id) THEN
            INSERT INTO `tags` (`name`)
            VALUES (_current_value);
             
            SELECT LAST_INSERT_ID()
            INTO _current_id;
        END IF;

        # Add to result set
        INSERT INTO `result_set` (`id`, `name`)
        VALUES (_current_id, _current_value);

        SET _previous_id = _current_id;
    END LOOP tags_loop;

    # Retusr result set
    SELECT *
    FROM `result_set`;
END
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
        WHERE `id` = __id;

        SELECT __id AS `result`;
    ELSE
        INSERT INTO `user` (`username`, `email`, `password`)
        VALUES (_username, _email, _password);

        SELECT LAST_INSERT_ID() AS `result`;
    END IF;
END
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
       _delimiter, '');
END
;;
DELIMITER ;
