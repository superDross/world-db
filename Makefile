.PHONY: up down pull logs

DB=postgresql://postgres:postgres@0.0.0.0:5432/world?sslmode=disable

# create:
# 	docker run -it -d -p 5432:5432 -e POSTGRES_HOST_AUTH_METHOD=trust --mount source=myvol2,target=/app --name devtest postgres

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# TODO: update this file to use similar conventions in the k8s-play repo

TARGET_MAX_CHAR_NUM=20
## show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## pull all images down
pull:
	docker-compose pull

## spin up containers
up:
	docker-compose up -d
	$(MAKE) logs

serve:
	$(MAKE) up

## spin down containers
down:
	docker-compose down

stop:
	$(MAKE) down

## access containers logs
logs:
	docker-compose logs -f

## log into a psql shell
psql-shell:
	psql $(DB)


## create all databases and tables
migrate:
	psql $(DB) 	-a -f migrations/forward/0001-create-database.sql
	psql $(DB) 	-a -f migrations/forward/0002-create-tables.sql
	psql $(DB) 	-a -f migrations/forward/0003-change-timezone-column-to-array.sql
	psql $(DB) 	-a -f migrations/forward/0004-alter-city-columns.sql
	psql $(DB) 	-a -f migrations/forward/0005-large-table.sql

## add data to the databases
add-data:
	psql $(DB) 	-a -f migrations/populate-database.sql
	psql $(DB) 	-a -f migrations/populate-json-fields.sql
	psql $(DB) 	-a -f migrations/populate-cities.sql

drop-db:
	psql $(DB) -c "DROP DATABASE world;"
