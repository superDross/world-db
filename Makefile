.PHONY: up down pull logs

# create:
# 	docker run -it -d -p 5432:5432 -e POSTGRES_HOST_AUTH_METHOD=trust --mount source=myvol2,target=/app --name devtest postgres

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


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
	docker-compose up -d postgres

## spin down containers
down:
	docker-compose down

## access containers logs
logs:
	docker-compose logs -f postgres

## log into a psql shell
psql:
	PGPASSWORD=postgres psql -h 0.0.0.0 -p 5432 -U postgres $(PSQL_ARGS)

## create all databases and tables
migrate:
	PSQL_ARGS="-a -f migrations/forward/0001-create-database.sql" $(MAKE) psql 
	PSQL_ARGS="-a -f migrations/forward/0002-create-tables.sql" $(MAKE) psql 
	PSQL_ARGS="-a -f migrations/forward/0003-change-timezone-column-to-array.sql" $(MAKE) psql 
	PSQL_ARGS="-a -f migrations/forward/0004-alter-city-columns.sql" $(MAKE) psql 

## add data to the databases
add-data:
	PSQL_ARGS="-a -f migrations/populate-database.sql" $(MAKE) psql 
	PSQL_ARGS="-a -f migrations/populate-json-fields.sql" $(MAKE) psql 
