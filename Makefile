.PHONY: run clean

run:
	docker-compose up -d --build 

clean:
	docker-compose down
