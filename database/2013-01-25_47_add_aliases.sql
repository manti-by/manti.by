ALTER TABLE `post`
    ADD COLUMN `alias`  varchar(64) NULL AFTER `name`,
    ADD UNIQUE INDEX `uk_post_alias` (`alias`) USING BTREE;

ALTER TABLE `gallery`
    ADD COLUMN `alias`  varchar(64) NULL AFTER `name`,
    ADD UNIQUE INDEX `uk_gallery_alias` (`alias`) USING BTREE;

ALTER TABLE `tags`
    ADD COLUMN `alias`  varchar(64) NULL AFTER `name`,
    ADD UNIQUE INDEX `uk_tags_alias` (`alias`) USING BTREE;