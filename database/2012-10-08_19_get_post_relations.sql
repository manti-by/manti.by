DROP PROCEDURE IF EXISTS `GET_POST_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_RELATIONS`(IN `_id` int)
BEGIN
    IF (_id > 0) THEN
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post_relations` AS pr
        LEFT JOIN `post` AS p ON p.`id` = pr.`destination_id`
        WHERE pr.`original_id` = _id;
    ELSE
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post` AS p;
    END IF;
END
;;
DELIMITER ;