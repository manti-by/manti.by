DROP PROCEDURE IF EXISTS `UPSERT_BROWSER_STAT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_BROWSER_STAT`(IN `_browser` varchar(255), IN `_version` varchar(64), IN `_count` int, IN `_timestamp` varchar(64))
BEGIN
    INSERT INTO `stats_browser` (`browser`, `version`, `count`, `timestamp`)
    VALUES (_browser, _version, _count, _timestamp);
END
;;
DELIMITER ;