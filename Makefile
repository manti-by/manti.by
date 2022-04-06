check:
	black --target-version py39 tests/pytest/

test:
	cd tests/pytest/ && pytest .


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

reorder-covers:
	./scripts/reorder_gallery.py

update-covers:
	./scripts/update_covers.py

rebuild-covers: clean-covers reorder-covers update-covers


clean-releases:
	rm -rf content/preview/*.mp3
	rm -rf content/preview/*.ogg
	rm -rf content/release/*.ogg

update-releases:
	./scripts/update_releases.py


build:
	cd app/ && cargo build

release:
	cd app/ && cargo build --release
	cp app/target/release/manti-by dist/app

run:
	cd app/ && cargo run

env:
	rustup override set nightly