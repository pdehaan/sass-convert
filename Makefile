SHELL   := /bin/bash
NPM_BIN := $(shell npm bin)
PATH    := $(NPM_BIN):$(PATH)

# ES6 to ES5 compilation
# ======================

dist:
	rm -rf $@
	6to5 lib --out-dir $@

develop:
	6to5-node --experimental $@


# Code quality
# ============

lint:
	eslint --reset ./lib

test:
	tape test/*.test.js | faucet


# Tools
# =====

rebuild:
	rm -rf node_modules
	npm install


.PHONY: dist develop test
.SILENT: dist develop
