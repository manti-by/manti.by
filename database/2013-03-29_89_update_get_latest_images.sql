DROP PROCEDURE IF EXISTS `GET_LATEST_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT *
        FROM `files`
        WHERE `type` = 'gallery'
        ORDER BY `timestamp` DESC, `id` DESC
        LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;