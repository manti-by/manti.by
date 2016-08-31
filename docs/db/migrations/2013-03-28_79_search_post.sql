DROP PROCEDURE IF EXISTS `SEARCH_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_POST`(IN `_query` text)
BEGIN
  CALL ALL_POSTS();

  SELECT DISTINCT p.*
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
     OR t.`alias` LIKE CONCAT('%', _query, '%');
END
;;
DELIMITER ;