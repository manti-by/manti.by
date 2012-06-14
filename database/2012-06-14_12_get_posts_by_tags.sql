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