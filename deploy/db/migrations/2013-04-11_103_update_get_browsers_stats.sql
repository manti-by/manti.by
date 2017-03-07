DROP PROCEDURE IF EXISTS `GET_SESSION_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SESSION_STATS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
      SELECT CONCAT(`country`, ' [', `ip`, ']') AS `visitor`, `count`, `timestamp`
      FROM `stats_session`
      WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 WEEK
        AND `ip` <> '127.0.0.1'
      ORDER BY `timestamp` ASC
      LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;