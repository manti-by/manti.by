DROP PROCEDURE IF EXISTS `UPSERT_SESSION_STAT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SESSION_STAT`(IN `_session` varchar(255), IN `_count` int)
BEGIN
    INSERT INTO `stats_browser` (`session`, `count`)
    VALUES (_session, _count);
END
;;
DELIMITER ;