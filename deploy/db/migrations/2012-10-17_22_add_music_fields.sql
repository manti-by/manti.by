ALTER TABLE `post`
    ADD COLUMN `is_music` tinyint(1) DEFAULT '0' AFTER `metadesc`,
    ADD COLUMN `catnum` varchar(16) DEFAULT NULL AFTER `is_music`,
    ADD COLUMN `genre` varchar(32) DEFAULT NULL AFTER `catnum`,
    ADD COLUMN `quality` varchar(255) DEFAULT NULL AFTER `genre`,
    ADD COLUMN `length` varchar(16) DEFAULT NULL AFTER `quality`,
    ADD COLUMN `tracklist` text AFTER `length`;