build:
	docker build -t mantiby/manti.by:latest .

docker-test:
	docker run --rm \
		-e DJANGO_SETTINGS_MODULE=manti_by.settings.sqlite \
		-v /home/manti/www/manti.by/manti/:/srv/manti/src/ \
		mantiby/manti.by:latest \
		pytest --create-db --disable-warnings

bash:
	docker exec -it manti-by-django bash

psql:
	docker exec -it manti-by-postgres psql -U manti_by

pg_dump:
	docker exec -it manti-by-postgres pg_dump -U manti_by -d manti_by > database.sql

migrate:
	docker exec -it manti-by-django python manage.py migrate

static:
	docker exec -it manti-by-django python manage.py collectstatic --no-input

check:
	flake8 manti_by/
	black --target-version py39 manti_by/

django-checks:
	python3 manage.py makemigrations --dry-run --check --verbosity=3

test:
	pytest
