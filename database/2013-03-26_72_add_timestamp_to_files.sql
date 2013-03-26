ALTER TABLE `files`
    ADD COLUMN `timestamp`  timestamp NULL DEFAULT CURRENT_TIMESTAMP AFTER `viewed`;