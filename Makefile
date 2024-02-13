NAME=inception

all: prune reload

hostname:
	echo "127.0.0.1 abeihaqi.42.fr" >> /etc/hosts

stop:
	docker compose -f srcs/docker-compose.yml down

clean: stop
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

prune: clean
	docker system prune -af

reload:
	docker compose -f srcs/docker-compose.yml up --build

.PHONY: hostname, stop clean prune reload all
