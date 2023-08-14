.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m
PORT    = 3001
# versions
APP_REVISION    = $(shell git rev-parse HEAD)
RUBY_VERSION    = $(shell script/get-tool-version ruby)
NODE_VERSION    = $(shell script/get-tool-version nodejs)
YARN_VERSION    = $(shell script/get-tool-version yarn)
BUNDLER_VERSION = $(shell script/get-tool-version bundler)

.PHONY: install
install:
	bundle install
	rails db:create

.PHONY: run
run:
	bundle exec rails server -p ${PORT}

.PHONY: css
css:
	bin/rails tailwindcss:watch

.PHONY: open_web
open_web:
	open http://127.0.0.1:${PORT}/

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}                  install dependencies"
	@echo "${YELLOW}make run${NC}                      run app"
	@echo "${YELLOW}make css${NC}                      watch tailwindcss"
	@echo "${YELLOW}make open_web${NC}                 open in browser and try it there"
	@echo
