DROP PROCEDURE IF EXISTS `GET_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_STATS`(IN `_start_date` timestamp, IN `_end_date` timestamp)
BEGIN
		SELECT *
		FROM `_log`
		WHERE `timestamp` >= _start_date
		  AND `timestamp` <= _end_date;
END
;;
DELIMITER ;