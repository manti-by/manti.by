DROP PROCEDURE IF EXISTS `GET_BROWSER_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_BROWSER_STATS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
      SELECT DISTINCT CONCAT(`browser`, ' ', `version`) AS browser, SUM(`count`) AS count
      FROM `stats_browser`
      WHERE `timestamp` >= DATE(NOW()) - INTERVAL 1 MONTH
      GROUP BY `browser`, `version`
      ORDER BY count DESC
      LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;