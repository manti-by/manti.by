start:
	@docker-compose -f deploy/docker-compose.yml up -d
	@printf "Waiting for PostgreSQL."
	@until docker exec -it manti-by-postgres psql -U manti -c '\l' > /dev/null; do printf "."; sleep 1; done
	@printf " Connected!\n"

stop:
	@docker-compose -f deploy/docker-compose.yml stop

destroy:
	@docker-compose -f deploy/docker-compose.yml down


bash:
	docker exec -it manti-by-app bash

ci:
	circleci build

flake:
	flake8

build:
	cd deploy/ && docker build -t mantiby/manti.by:latest .

psql:
	docker exec -it manti-by-postgres psql -U manti

pg_dump:
	docker exec -it manti-by-postgres pg_dump -U manti -d manti > deploy/database/manti.sql
	sudo chown -R ${USER}:${GROUP} deploy/database/