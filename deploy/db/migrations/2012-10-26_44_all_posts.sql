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
            , p.`created`, p.`viewed`, p.`timestamp`
        FROM `post` AS p
    );
END
;;
DELIMITER ;