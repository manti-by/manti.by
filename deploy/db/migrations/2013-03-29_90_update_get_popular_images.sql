DROP PROCEDURE IF EXISTS `GET_POPULAR_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POPULAR_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT *
        FROM `files`
        WHERE `type` = 'gallery'
        ORDER BY `viewed` DESC
        LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;