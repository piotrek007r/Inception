# change default dash to bash due some unsupported flags
SHELL := /bin/bash

SRCS = srcs

.PHONY: prep up down build clean fclean re

all:

# creating secret files and filling them by prompting user
# creating folders where vouluems will be related
prep:
	mkdir -p secrets
	@if [ ! -f secrets/db_password.txt ]; then \
		read -s -p "Enter DB password: " pass; echo ""; \
		echo $$pass > secrets/db_password.txt; \
	fi
	@if [ ! -f secrets/db_root_password.txt ]; then \
		read -s -p "Enter DB root password: " pass; echo ""; \
		echo $$pass > secrets/db_root_password.txt; \
	fi

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
