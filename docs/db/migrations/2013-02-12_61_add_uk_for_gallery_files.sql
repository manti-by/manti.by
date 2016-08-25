ALTER TABLE `gallery_files`
    ADD UNIQUE INDEX `uk_gallery_file` (`gallery_id`, `file_id`);