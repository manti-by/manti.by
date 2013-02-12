DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS_BY_ID`(IN `_id` int)
BEGIN
    SELECT f.*
    FROM `files` f
    JOIN `gallery_files` gf ON gf.`file_id` = f.`id`
    WHERE gf.`gallery_id` = _id;
END
;;
DELIMITER ;