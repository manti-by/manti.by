DROP PROCEDURE IF EXISTS `UPSERT_NGINX_STAT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_NGINX_STAT`(IN `_request` text, IN `_count` int)
BEGIN
    DECLARE __id INT;

    SELECT `id`
    INTO __id
    FROM `stats_nginx`
    WHERE `request` = _request;

    IF __id > 0 THEN
        UPDATE `stats_nginx`
        SET `count` = `count` + _count
        WHERE `id` = __id;
    ELSE
        INSERT INTO `stats_nginx` (`request`, `count`)
        VALUES (_request, _count);
    END IF;
END
;;
DELIMITER ;