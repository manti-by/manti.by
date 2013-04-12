DROP PROCEDURE IF EXISTS `GET_DOWNLOAD_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_DOWNLOAD_STATS`(IN `_limit` int)
BEGIN
    SET @rows = _limit;

    PREPARE stmt FROM "
    SELECT f.`name`, f.`source`, f.`viewed`, ff.`viewed` AS previwed
    FROM `files` f
      LEFT JOIN `files_relations` fr ON fr.`original_id` = f.`id`
      LEFT JOIN `files` ff ON ff.`id` = fr.`target_id`
    ORDER BY f.`viewed` DESC, ff.`viewed` DESC
    LIMIT ?;";

    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;