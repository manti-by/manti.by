DROP PROCEDURE IF EXISTS manti.GET_LATEST_IMAGES;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
  BEGIN
    PREPARE stmt FROM "
      SELECT f.*, g.`gallery_id`
      FROM `files` f
      JOIN `gallery_files` g ON f.`id` = g.`file_id`
      WHERE f.`type` = 'gallery'
        AND g.`gallery_id` <> 13
      ORDER BY f.`order` DESC, f.`timestamp` DESC, f.`id` DESC
      LIMIT ?;";
    SET @rows = _limit;
    EXECUTE stmt USING @rows;
  END;