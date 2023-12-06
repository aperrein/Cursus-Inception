DC	=	srcs/docker-compose.yml

build	:
	docker-compose -f $(DC) build

up	:
	docker-compose -f $(DC) up -d

stop	:
	docker-compose -f $(DC) stop

all	:	build

clean	:	stop
	docker system prune -af

fclean	:	clean
	rm -rf ~/../home/aperrein/data/mariadb/ ~/../home/aperrein/data/wordpress/
	mkdir ~/../home/aperrein/data/mariadb ~/../home/aperrein/data/wordpress

re	:	fclean build
