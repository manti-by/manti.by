build:
	docker build -t mantiby/manti.by:latest .

docker-test:
	docker run --rm \
	    -e DJANGO_SETTINGS_MODULE=manti_by.settings.sqlite \
	    -v /home/manti/www/manti.by/src/:/srv/manti.by/src/ \
	    mantiby/manti.by:latest \
	    pytest --create-db --disable-warnings

bash:
	docker exec -it manti-by-django bash

shell:
	docker exec -it manti-by-django python manage.py shell

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
	black --target-version py38 manti_by/
	standard --fix manti_by/static/js/

test:
	pytest
