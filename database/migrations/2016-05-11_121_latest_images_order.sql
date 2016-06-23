DROP PROCEDURE IF EXISTS `GET_LATEST_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
        SELECT f.*
        FROM `files` f
        JOIN `gallery_files` g ON f.`id` = g.`file_id`
        WHERE f.`type` = 'gallery'
            AND g.`gallery_id` <> 13
        ORDER BY f.`order` DESC, f.`timestamp` DESC, f.`id` DESC
        LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END