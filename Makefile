ACTION_NAME := onctl-action-hello
VERSION := $(shell git describe --tags --always)

all: build

build:
	mkdir -p dist
	GOOS=linux GOARCH=amd64 go build -o dist/$(ACTION_NAME)-linux-amd64 main.go
	GOOS=darwin GOARCH=amd64 go build -o dist/$(ACTION_NAME)-darwin-amd64 main.go
	GOOS=darwin GOARCH=arm64 go build -o dist/$(ACTION_NAME)-darwin-arm64 main.go
	GOOS=linux GOARCH=arm64 go build -o dist/$(ACTION_NAME)-linux-arm64 main.go

release: build
	cd dist && sha256sum * > checksums.txt

.PHONY: all build release