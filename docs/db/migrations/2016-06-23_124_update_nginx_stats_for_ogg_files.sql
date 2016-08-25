DROP PROCEDURE IF EXISTS `GET_DOWNLOAD_STATS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_DOWNLOAD_STATS`(IN `_limit` int)
  BEGIN
    SET @rows = _limit;
    PREPARE stmt FROM "
    SELECT DISTINCT f.`name`, f.`source`, p.`viewed`, f.`viewed` AS downloaded,
      (
        SELECT _f.`viewed`
        FROM `post` _p
          LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
          LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
        WHERE _f.`type` = 'preview'
              AND _p.`id` = p.`id`
      ) AS previewed,
      sp.`count` AS nginx_viewed, sf.`count` AS nginx_downloaded,
      IFNULL((
               SELECT _s.`count`
               FROM `post` _p
                 LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
                 LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
                 LEFT JOIN `stats_nginx` _s ON _s.`request` = SUBSTRING(_f.`source` FROM 2)
               WHERE _f.`type` = 'preview'
                     AND _p.`id` = p.`id`
             ), 0) + IFNULL((
                              SELECT _s.`count`
                              FROM `post` _p
                                LEFT JOIN `post_files` _pf ON _pf.`post_id` = _p.`id`
                                LEFT JOIN `files` _f ON _f.`id` = _pf.`file_id`
                                LEFT JOIN `stats_nginx` _s ON _s.`request` = REPLACE(SUBSTRING(_f.`source` FROM 2), '.mp3', '.ogg')
                              WHERE _f.`type` = 'preview'
                                    AND _p.`id` = p.`id`
                            ), 0) AS nginx_previewed
    FROM `post` p
      LEFT JOIN `post_files` pf ON pf.`post_id` = p.`id`
      LEFT JOIN `files` f ON f.`id` = pf.`file_id`
      LEFT JOIN `stats_nginx` sp ON sp.`request` = CONCAT('/blog/', p.`alias`, '/')
      LEFT JOIN `stats_nginx` sf ON sf.`request` = SUBSTRING(f.`source` FROM 2)
    WHERE f.`type` = 'release'
    ORDER BY p.`viewed` DESC, sp.`count` DESC
    LIMIT ?;";
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;