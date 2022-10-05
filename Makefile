.PHONY: init
init:
	@make up
	@make install

.PHONY: up
up:
	docker compose -f ./.docker/dev/docker-compose.yml up -d

.PHONY: rebuild
rebuild:
	docker compose -f ./.docker/dev/docker-compose.yml up -d --build

.PHONY: stop
stop:
	docker compose -f ./.docker/dev/docker-compose.yml stop

.PHONY: down
down: 
	docker compose -f ./.docker/dev/docker-compose.yml down

.PHONY: destroy
destroy:
	docker compose -f ./.docker/dev/docker-compose.yml down --rmi all --volumes --remove-orphans

.PHONY: refresh
refresh:
	@make destroy
	@make up

.PHONY: install
install:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn'

.PHONY: dev
dev:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn dev'

# e.g. $ make add MODULE=package_name
.PHONY: add
add:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn add $(MODULE)'

# e.g. $ make add-dev MODULE=package_name
.PHONY: add-dev
add-dev:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn add -D $(MODULE)'

# e.g. $ make remove MODULE=package_name
.PHONY: remove
remove:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn remove $(MODULE)'

.PHONY: build
build:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn build'

.PHONY: start
start:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn start'

.PHONY: lint
lint:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn lint'

.PHONY: format
format:
	docker compose -f ./.docker/dev/docker-compose.yml exec node /bin/bash -c 'yarn format'
