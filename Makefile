check:
	flake8 scripts/
	black --target-version py39 scripts/

test:
	pytest


clean-gallery:
	rm -rf content/gallery.json
	rm -rf content/gallery/*.webp

reorder-gallery:
	./scripts/reorder_gallery.py

update-gallery:
	./scripts/update_gallery.py

rebuild-gallery: clean-gallery reorder-gallery update-gallery


clean-covers:
	rm -rf content/covers.json
	rm -rf content/covers/*.webp

update-covers:
	./scripts/update_covers.py

clean-releases:
	rm -rf content/preview/*.mp3
	rm -rf content/preview/*.ogg
	rm -rf content/release/*.ogg

update-releases:
	./scripts/update_releases.py


build:
	cd app/ && cargo build

run:
	cd app/ && cargo run