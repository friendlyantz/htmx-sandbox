.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

# versions
APP_REVISION    = $(shell git rev-parse HEAD)
RUBY_VERSION    = $(shell script/get-tool-version ruby)
NODE_VERSION    = $(shell script/get-tool-version nodejs)
YARN_VERSION    = $(shell script/get-tool-version yarn)
BUNDLER_VERSION = $(shell script/get-tool-version bundler)

.PHONY: install
install:
	bundle install

.PHONY: run
run:
	bundle exec rerun rackup

.PHONY: get_request
get_request:
	curl http://localhost:9292/

.PHONY: post_request
post_request:
	curl -X POST -d 'LADIDA' http://localhost:9292/

.PHONY: post_json_request
post_json_request:
	curl -X POST -H "Content-Type: application/json" -d '{"key1": "value1", "key2": "value2"}' http://localhost:9292/

.PHONY: open_web
open_web:
	open http://127.0.0.1:9292/

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}                  install dependencies"
	@echo "${YELLOW}make run${NC}                      run rack server with hot reload"
	@echo "${YELLOW}make get_request${NC}              curl /GET request"
	@echo "${YELLOW}make post_request${NC}             curl /POST request with LADIDA text"
	@echo "${YELLOW}make post_json_request${NC}        curl /POST request with JSON payload"
	@echo "${YELLOW}make open_web${NC}                 open in browser and try it there"
	@echo
