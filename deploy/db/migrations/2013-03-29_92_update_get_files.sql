DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    IF _type <> '' THEN
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				WHERE `type` = _type
				ORDER BY `source`
				LIMIT ?;";
    ELSE
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				ORDER BY `source`
				LIMIT ?;";
    END IF;

		SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;