SHELL := /bin/bash
NAME := i0nio
GCR_NAME := gcr.io/organic-spirit-217211/${NAME}
ROOT_PACKAGE := github.com/i0n/i0n.io

BRANCH     := $(shell git rev-parse --abbrev-ref HEAD 2> /dev/null  || echo 'unknown')
BUILD_DATE := $(shell date +%Y%m%d-%H:%M:%S)
BUILD_USER := $(shell whoami)

all: build

check: fmt build test

print-rev:
	@echo $(REV)

print-branch:
	@echo $(BRANCH)

print-build-date:
	@echo $(BUILD_DATE)

print-build-user:
	@echo $(BUILD_USER)

build: 
	cargo build --release

docker-build-latest:
	docker build --no-cache . -t ${GCR_NAME}:latest

docker-push:
	docker push ${GCR_NAME}:latest
