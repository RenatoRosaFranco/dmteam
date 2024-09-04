DOCKER_COMPOSE = docker-compose
APP_CONTAINER = dmteam-app
DOCKER_RUN = $(DOCKER_COMPOSE) run --rm $(APP_CONTAINER)

build:
	@docker build -t $(APP_CONTAINER) .

up:
	@$(DOCKER_COMPOSE) up

down:
	@$(DOCKER_COMPOSE) down

dbcreate:
	@$(DOCKER_RUN) bundle exec rails db:create

dbdrop:
	@$(DOCKER_RUN) bundle exec rails db:drop

migrate:
	@$(DOCKER_RUN) bundle exec rails db:migrate

seed:
	@$(DOCKER_RUN) bundle exec rails db:seed

bash:
	@$(DOCKER_RUN) bash

console:
	@$(DOCKER_RUN) bundle exec rails console

test:
	@$(DOCKER_RUN) bundle exec rspec

install:
	@$(DOCKER_RUN) bundle install

setup:
	@$(DOCKER_RUN) bundle exec rails db:setup

assets-precompile:
	@$(DOCKER_RUN) bundle exec rake assets:precompile