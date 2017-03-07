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