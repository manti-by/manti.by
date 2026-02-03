run:
	uv run manage.py runserver

shell:
	uv run manage.py shell

migrate:
	uv run manage.py migrate

create-migrations:
	uv run manage.py makemigrations

messages:
	uv run manage.py makemessages -l ru

locale:
	uv run manage.py compilemessages -l ru

static:
	uv run manage.py collectstatic --no-input

check:
	git add .
	uv run ty check
	uv run pre-commit run

django-checks:
	uv run manage.py makemigrations --dry-run --check --verbosity=3 --settings=manti_by.settings.sqlite
	uv run manage.py check --fail-level WARNING --settings=manti_by.settings.sqlite

test:
	uv run pytest --disable-warnings --ds=manti_by.settings.test odin/ manti_by/

pip:
	uv sync --all-extras --dev

update:
	uv run uv-bump
	uv sync --all-extras --dev
	uv run pre-commit autoupdate


ci: pip check django-checks docker-build


docker-build:
	docker build -t mantiby/manti.by:latest .

docker-bash:
	docker exec -it manti-by-django bash

docker-psql:
	docker exec -it manti-by-postgres psql -U manti_by

docker-dump:
	docker exec -it manti-by-postgres pg_dump -U manti_by -d manti_by > database.sql

docker-restore:
	docker cp database.sql manti-by-postgres:/tmp/database.sql
	docker exec -it manti-by-postgres psql -U manti_by manti_by -f /tmp/database.sql

docker-migrate:
	docker exec -it manti-by-django python manage.py migrate

docker-static:
	docker exec -it manti-by-django python manage.py collectstatic --no-input
