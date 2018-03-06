.PHONY: run build push
BMLT_VERSION=2.10.0

run:
	docker-compose up -d --build 

clean:
	docker-compose down

build:
	docker build . -t radius314/bmlt:${BMLT_VERSION}

push:
	docker push radius314/bmlt:${BMLT_VERSION}
