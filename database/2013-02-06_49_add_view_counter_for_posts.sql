ALTER TABLE `post`
    ADD COLUMN `viewed`  int(11) UNSIGNED NULL DEFAULT 0 AFTER `created`