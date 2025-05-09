build:
	docker build -t mantiby/manti.by:latest .

bash:
	docker exec -it manti-by-django bash

psql:
	docker exec -it manti-by-postgres psql -U manti_by

dump:
	docker exec -it manti-by-postgres pg_dump -U manti_by -d manti_by > database.sql

restore:
	docker cp database.sql manti-by-postgres:/tmp/database.sql
	docker exec -it manti-by-postgres psql -U manti_by manti_by -f /tmp/database.sql

migrate:
	docker exec -it manti-by-django python manage.py migrate

static:
	docker exec -it manti-by-django python manage.py collectstatic --no-input

check:
	git add .
	pre-commit run

django-checks:
	python manage.py makemigrations --dry-run --check --verbosity=3
	python manage.py check --fail-level WARNING

test:
	pytest manti_by/

pip:
	uv pip install -r requirements.txt

update:
	pcu requirements.txt -u
	pre-commit autoupdate
