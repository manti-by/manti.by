DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    IF (_type <> '') THEN
        SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
        FROM `files`
        WHERE `type` = _type
        ORDER BY `source`
        LIMIT _limit;
    ELSE
        SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`
        FROM `files`
        ORDER BY `source`
        LIMIT _limit;
    END IF;
END
;;
DELIMITER ;