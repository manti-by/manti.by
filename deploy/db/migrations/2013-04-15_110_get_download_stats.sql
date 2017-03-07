DROP PROCEDURE IF EXISTS `GET_DOWNLOAD_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_DOWNLOAD_STATS`(IN `_limit` int)
BEGIN
    SET @rows = _limit;

  PREPARE stmt FROM "
      SELECT f.`name`, f.`source`, p.`viewed`, f.`viewed` AS downloaded, ff.`viewed` AS previewed
      FROM `files` f
      LEFT JOIN `files_relations` fr ON fr.`original_id` = f.`id`
      LEFT JOIN `files` ff ON ff.`id` = fr.`target_id`
      LEFT JOIN `post_files` pf ON pf.`file_id` = f.`id`
      LEFT JOIN `post` p ON p.`id` = pf.`post_id`
      WHERE f.`type` = 'release'
      ORDER BY p.`viewed` DESC, f.`viewed` DESC
      LIMIT ?;";

    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;