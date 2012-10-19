DROP PROCEDURE IF EXISTS `CREATE_FILE_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_FILE_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        # Do Inserts
        INSERT INTO `post_files` (`post_id`, `file_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;