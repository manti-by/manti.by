ALTER TABLE `stats_session`
    ADD COLUMN `ip`  varchar(50) NULL AFTER `session`;

ALTER TABLE `stats_session`
    ADD COLUMN `country`  varchar(2) NULL AFTER `ip`;