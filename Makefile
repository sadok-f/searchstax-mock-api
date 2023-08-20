BINARY_NAME=searchstax-mock-api

build:
	go build

run: install
	${BINARY_NAME}

install: build
	go install


