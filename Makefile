.PHONY: build run debug
BMLT_VERSION=2.8.11

build:
	docker build . -t radius314/bmlt:${BMLT_VERSION}

run:
	docker run -d -p 8080:80 radius314/bmlt:${BMLT_VERSION}

debug:
	docker run -it --entrypoint=/bin/bash -p 8080:80 radius314/bmlt:${BMLT_VERSION}
