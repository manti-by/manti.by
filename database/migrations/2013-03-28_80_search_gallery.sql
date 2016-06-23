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
     OR t.`alias` LIKE CONCAT('%', _query, '%');
END
;;
DELIMITER ;