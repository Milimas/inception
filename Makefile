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
	docker compose -f srcs/docker-compose.yml up --build -d 

start:
	docker compose -f srcs/docker-compose.yml up -d

dev:
	docker compose -f srcs/docker-compose.yml up

tlstest:
	curl -I -v --tlsv1.3 --tls-max 1.3 https://abeihaqi.42.fr

correction: cstop rmps rmim rmvl rmnw

rmnw:
	-docker network rm $(shell docker network ls -q)
rmvl:
	-docker volume rm $(shell docker volume ls -q);
rmim:
	-docker rmi -f $(shell docker images -qa);
rmps:
	-docker rm $(shell docker ps -qa);
cstop:
	-docker stop $(shell docker ps -qa)


.PHONY: hostname, stop clean prune reload all correction cstop rmps rmim rmvl rmnw
