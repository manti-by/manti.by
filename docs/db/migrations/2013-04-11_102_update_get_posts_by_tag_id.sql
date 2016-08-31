DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAG_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAG_ID`(IN `_id` int, IN `_limit` int)
BEGIN
		CALL ALL_POSTS();

    PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
        JOIN `tags` AS t ON t.`id` = pt.`tag_id`
        WHERE t.`id` = ?
        ORDER BY p.`created` DESC
        LIMIT 0, ?;";

		SET @id = _id;
    SET @rows = _limit;
    EXECUTE stmt USING @id, @rows;
END
;;
DELIMITER ;