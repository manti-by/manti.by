DROP PROCEDURE IF EXISTS `UPSERT_GALLERY_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY_FILES`(IN `_gallery_id` int, IN `_file_id` int)
BEGIN
    INSERT INTO `gallery_files` (`gallery_id`, `file_id`)
    VALUES (_gallery_id, _file_id);

    SELECT LAST_INSERT_ID();
END
;;
DELIMITER ;
