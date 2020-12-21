DOCKER_REPOSITORY ?=## Docker repository (default: '')
DOCKER_IMAGE ?= docker-compose## Docker image name (default docker-compose)
DOCKER_COMPOSE_VERSION ?= 1.27.4## Docker compose version (default: 1.27.4)
DOCKER_TAG ?= $(DOCKER_COMPOSE_VERSION)## Docker image tag (default: $DOCKER_COMPOSE_VERSION)

HELP_STYLE_OFF?=$$(tput sgr0 2>/dev/null)
HELP_STYLE_TITLE?=$$(tput bold 2>/dev/null)
HELP_STYLE_TARGET?=$$(tput setaf 6 2>/dev/null)
HELP_STYLE_CONFIG?=$$(tput setaf 2 2>/dev/null)

help: ## display the help message
	@echo "$(HELP_STYLE_TITLE)TARGETS:$(HELP_STYLE_OFF)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk "BEGIN {FS = \":.*?## \"}; {printf \"$(HELP_STYLE_TARGET)%-30s$(HELP_STYLE_OFF) %s\n\", \$$1, \$$2}"
	@echo "\n$(HELP_STYLE_TITLE)CONFIGURATION:$(HELP_STYLE_OFF)"
	@grep -E '^[a-zA-Z_-]+[ ?=]+.*?## .*$$' $(MAKEFILE_LIST) | sort | awk -v default_val="hello" "BEGIN {FS = \"[ ?=].*?## \"}; {printf \"$(HELP_STYLE_CONFIG)%-30s\033[0m %s\n\", \$$1, \$$2}"
	@echo ""

docker-build: ## build the docker image
	docker build --build-arg VERSION=$(DOCKER_COMPOSE_VERSION) --tag $(DOCKER_REPOSITORY)$(DOCKER_IMAGE):$(DOCKER_TAG) -f Dockerfile .

docker-push: ## push the image to the docker repository
	docker push $(DOCKER_REPOSITORY)$(DOCKER_IMAGE):$(DOCKER_TAG)
