MAKEFLAGS += --no-print-directory

PROJECTNAME 	= spring-boot-angular-helloworld

.PHONY: clean package build release deploy-k8s

# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

help: Makefile
	@echo
	@echo "Project \033[31m$(PROJECTNAME)\033[0m"", please choose a command to run"
	@echo
	@grep -E '^[a-zA-Z\._-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'
	@echo


clean: clean-backend clean-frontend ## Clean up project

build: build-backend build-frontend ## Build backend and frontend

deploy: deploy-backend deploy-frontend ## Deploy backend and frontend

clean-backend:
	$(info ==============================================================)
	$(info Nettoyage du projet backend									 )
	$(info ==============================================================)
	@cd backend && mvn clean

clean-frontend:
	$(info ==============================================================)
	$(info Nettoyage du projet backend									 )
	$(info ==============================================================)
	@cd frontend && npm run clean


build-backend:
	$(info ==============================================================)
	$(info Construction du projet Backend								 )
	$(info ==============================================================)
	@cd backend && mvn clean verify

build-frontend:
	$(info ==============================================================)
	$(info Construction du projet Frontend								 )
	$(info ==============================================================)
	@$(MAKE) -f $(THIS_FILE) _npm-install NPM_PROJECT_DIR=frontend
	@$(MAKE) -f $(THIS_FILE) _npm-run-build NPM_PROJECT_DIR=frontend


deploy-backend:
	$(info ==============================================================)
	$(info Deploiement du projet Backend								 )
	$(info ==============================================================)
	@cd backend
	@echo "Deploying backend"

deploy-frontend:
	$(info ==============================================================)
	$(info Deploiement du projet Frontend								 )
	$(info ==============================================================)
	@echo "Deploying frontend"


_npm-install:
	@cd $(NPM_PROJECT_DIR) && npm install

_npm-run-test:
	@cd $(NPM_PROJECT_DIR) && npm run test

_npm-run-build:
	@cd $(NPM_PROJECT_DIR) && npm run build
