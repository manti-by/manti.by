DROP PROCEDURE IF EXISTS `CHECK_USERNAME`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_USERNAME`(IN `_username` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `username` = _username
    LIMIT 0, 1;
END
;;
DELIMITER ;