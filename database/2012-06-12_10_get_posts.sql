DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limit` int)
BEGIN
    SELECT p.`id`, p.`name`, p.`teaser`, p.`description`, 
        (
            SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_t.`id`, ',"name":', _t.`name`, '"}')), ']')
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
            SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_p.`id`, ',"name":"', _p.`name`, '"}')), ']')
            FROM `post_relations` AS _pr 
            JOIN `post` AS _p ON _p.`id` = _pr.`destination_id` 
            WHERE _pr.`original_id` = p.`id`
        ) AS `relations`
        , p.`timestamp`
    FROM `post` AS p
    LIMIT _limit;
END
;;
DELIMITER ;
