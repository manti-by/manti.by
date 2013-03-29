DROP PROCEDURE IF EXISTS `GET_POSTS_BY_VIEW_COUNT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_VIEW_COUNT`(IN `_limit` int, IN `_with_covers` tinyint)
BEGIN
		CALL ALL_POSTS();

		IF _with_covers > 0 THEN
		    PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					WHERE `covers` IS NOT NULL
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		ELSE
				PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		END IF;

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;