build:
	docker build -t mantiby/manti.by:latest .

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
	git add .
	pre-commit run

django-checks:
	python3 manage.py makemigrations --dry-run --check --verbosity=3
	python manage.py check --fail-level WARNING

test:
	pytest

update-requirements:
	pcu requirements.txt -u