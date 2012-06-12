ALTER TABLE `post`
    ADD COLUMN `teaser`  varchar(512) NULL AFTER `name`,
    ADD COLUMN `metadesc`  varchar(255) NULL AFTER `description`;