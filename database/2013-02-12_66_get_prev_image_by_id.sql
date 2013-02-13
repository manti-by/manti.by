DROP PROCEDURE IF EXISTS `GET_PREV_IMAGE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_PREV_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;

    SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;

    SELECT f.*
    FROM `gallery_files` gf
    JOIN `files` f ON f.`id` = gf.`file_id`
    WHERE gf.`file_id` < _id
      AND gf.`gallery_id` = __gallery_id
    ORDER BY gf.`file_id` DESC
    LIMIT 1;
END
;;
DELIMITER ;