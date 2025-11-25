.PHONY: help

MAKEFLAGS += --silent
.DEFAULT_GOAL := help

help: ## Show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

include .env

prepare: ## Prepare stack to run
	npm install

start: ## Start application in dev mode
	npm run start

lint: ## Run linters
	npm run lint -- $(filter-out $@,$(MAKECMDGOALS))
	$(call run_linter,)

lint-fix: ## Run linters with fix
	npm run lint:fix -- $(filter-out $@,$(MAKECMDGOALS))
	$(MAKE) linter-fix

build: ## Build libs and applications
	npm run build

test: ## Run tests
	npm run test:ci

ci: ## Run CI checks
	$(MAKE) prepare
	$(MAKE) lint-fix
	npm audit fix
	$(MAKE) build
	$(MAKE) test

linter-fix: ## Execute linting and fix
	$(call run_linter, \
		-e FIX_CSS_PRETTIER=true \
		-e FIX_JSON_PRETTIER=true \
		-e FIX_YAML_PRETTIER=true \
		-e FIX_MARKDOWN=true \
		-e FIX_MARKDOWN_PRETTIER=true \
		-e FIX_NATURAL_LANGUAGE=true)

define run_linter
	DEFAULT_WORKSPACE="$(CURDIR)"; \
	LINTER_IMAGE="linter:latest"; \
	VOLUME="$$DEFAULT_WORKSPACE:$$DEFAULT_WORKSPACE"; \
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) --tag $$LINTER_IMAGE .; \
	docker run \
		-e DEFAULT_WORKSPACE="$$DEFAULT_WORKSPACE" \
		-e FILTER_REGEX_INCLUDE="$(filter-out $@,$(MAKECMDGOALS))" \
		-e IGNORE_GITIGNORED_FILES=true \
		-e VALIDATE_CSS=false \
		$(1) \
		-v $$VOLUME \
		--rm \
		$$LINTER_IMAGE
endef

define open-in-browser
	@if command -v x-www-browser &> /dev/null ; then x-www-browser $(1); \
	elif command -v xdg-open &> /dev/null ; then xdg-open $(1); \
	elif command -v open &> /dev/null ; then open $(1); \
	elif command -v start &> /dev/null ; then	start $(1);	fi;
endef

#############################
# Argument fix workaround
#############################
%:
	@:
