DROP PROCEDURE IF EXISTS `GET_SEF_MAP_ALIAS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF_MAP_ALIAS`(IN `_field` varchar(255), IN `_table` varchar(255), IN `_id` int)
BEGIN
    SET @q = CONCAT('SELECT ', _field, ' FROM ', _table, ' WHERE `id` = ', _id);
    PREPARE stmt FROM @q;
    EXECUTE stmt;
END
;;
DELIMITER ;