DROP PROCEDURE IF EXISTS `TRACK_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_POST_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `post`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `post`
    WHERE `id` = _id; 
END
;;
DELIMITER ;