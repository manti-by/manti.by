DROP PROCEDURE IF EXISTS `SEARCH_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_GALLERY`(IN `_query` text)
BEGIN
  SELECT DISTINCT g.`id`, g.`path`, g.`name`, g.`alias`, g.`description`, g.`metadesc`, g.`timestamp`
  FROM `gallery` g
  LEFT JOIN `gallery_tags` gt ON gt.`gallery_id` = g.`id`
  LEFT JOIN `tags` t ON t.`id` = gt.`tag_id`
  WHERE g.`name` LIKE CONCAT('%', _query, '%')
     OR g.`alias` LIKE CONCAT('%', _query, '%')
     OR g.`description` LIKE CONCAT('%', _query, '%')
     OR g.`metadesc` LIKE CONCAT('%', _query, '%')
     OR t.`name` LIKE CONCAT('%', _query, '%')
     OR t.`alias` LIKE CONCAT('%', _query, '%');
END
;;
DELIMITER ;