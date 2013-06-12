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
			  LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;