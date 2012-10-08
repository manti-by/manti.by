DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    SELECT `id`, `name`
    FROM `files`
    WHERE `type` = _type
    LIMIT _limit;
END
;;
DELIMITER ;