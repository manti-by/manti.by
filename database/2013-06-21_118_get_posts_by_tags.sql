DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    PREPARE stmt FROM "
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
END
;;
DELIMITER ;