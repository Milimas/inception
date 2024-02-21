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

reload: stop
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -p inception -f srcs/docker-compose.yml up --build -d 

run:
	docker compose -p inception -f srcs/docker-compose.yml up -d

tlstest:
	curl -I -v --tlsv1.3 --tls-max 1.3 https://abeihaqi.42.fr

.PHONY: hostname, stop clean prune reload all
