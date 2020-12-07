start:
	docker-compose -f deploy/docker-compose.yml up -d

stop:
	docker-compose -f deploy/docker-compose.yml stop

destroy:
	docker-compose -f deploy/docker-compose.yml down

dc-test:
	docker-compose -f deploy/docker-compose.yml run --rm django pytest --create-db --disable-warnings

bash:
	docker exec -it django bash

build:
	cd deploy/ && docker build -t mantiby/manti.by:latest .

psql:
	docker exec -it manti-by-postgres psql -U manti

pg_dump:
	docker exec -it manti-by-postgres pg_dump -U manti -d manti > deploy/database/manti.sql
	sudo chown -R ${USER}:${GROUP} deploy/database/

migrate:
	docker exec -it manti-by-app python manage.py migrate

static:
	docker exec -it manti-by-app python manage.py collectstatic --no-input

check:
	flake8
	black --target-version py38 app/
	standard --fix app/core/static/js/

test:
	pytest app/