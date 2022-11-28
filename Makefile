name = inception

all:
	@printf "Launch configuration for ${name}..\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Building configuration for ${name}..\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping configuration for ${name}..\n"
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@printf "Rebuilding configuration for ${name}..\n"
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "Cleaning configuration for ${name}..\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress_vol/*
	@sudo rm -rf ~/data/mariadb_vol/*

fclean: clean
	@printf "Total cleaning of all configurations for ${name}..\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume rm $$(docker volume ls -q)

PHONY: all build down re clean fclean
