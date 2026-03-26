SRCS = srcs

.PHONY: prep up down build clean fclean re

all:

prep:
	sudo mkdir -p /home/pruszkie/data/mariadb
	sudo mkdir -p /home/pruszkie/data/wordpress
	sudo chmod -R 777 /home/pruszkie/data/mariadb
	sudo chmod -R 777 /home/pruszkie/data/wordpress

up: prep
	cd $(SRCS) && sudo docker compose up -d --build

down:
	cd $(SRCS) && sudo docker compose down

build:
	cd $(SRCS) && sudo docker compose build 

clean:
	cd $(SRCS) && sudo docker compose down -v

fclean:
	cd $(SRCS) && sudo docker compose down -v 
	sudo docker system prune -af
	
re: fclean up
