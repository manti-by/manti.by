ALTER TABLE `post_files`
    ADD UNIQUE INDEX `uk_post_file` (`post_id`, `file_id`);