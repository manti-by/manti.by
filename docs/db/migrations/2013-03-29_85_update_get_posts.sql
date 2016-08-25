DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limitstart` int, IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    PREPARE stmt FROM "
        SELECT p.*
        FROM `all_posts` AS p
        WHERE p.`is_music` = 1
        ORDER BY p.`created` DESC
        LIMIT ?, ?;";

    SET @skip = _limitstart;
    SET @rows = _limit;
    EXECUTE stmt USING @skip, @rows;
END
;;
DELIMITER ;