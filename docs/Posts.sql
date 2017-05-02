SELECT p.`id` as original_id, p.`alias`, p.`name`, p.`teaser`, p.`description`,
  (
    SELECT GROUP_CONCAT(_t.`name`)
    FROM `post_tags` AS _pt
      JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id`
    WHERE _pt.`post_id` = p.`id`
          AND _pt.`type` = 'meta'
  ) AS `metakeys`,
  p.`metadesc`,
  p.`is_music`, p.`catnum`, p.`genre`, p.`length`, p.`quality`, p.`tracklist`,
  (
    SELECT GROUP_CONCAT(_f.`source`)
    FROM `post_files` AS _pf
      JOIN `files` AS _f ON _f.`id` = _pf.`file_id`
    WHERE _pf.`post_id` = p.`id`
          AND _f.`type` = 'release'
  ) AS `release`,
  (
    SELECT GROUP_CONCAT(_f.`source`)
    FROM `post_files` AS _pf
      JOIN `files` AS _f ON _f.`id` = _pf.`file_id`
    WHERE _pf.`post_id` = p.`id`
          AND _f.`type` = 'covers'
  ) AS `cover`,
  (
    SELECT GROUP_CONCAT(_p.`id`)
    FROM `post_relations` AS _pr
      JOIN `post` AS _p ON _p.`id` = _pr.`destination_id`
    WHERE _pr.`original_id` = p.`id`
  ) AS `relations`
  , p.`created`, p.`viewed`
FROM `post` AS p
