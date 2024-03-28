# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpeulet <mpeulet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 09:13:18 by mpeulet           #+#    #+#              #
#    Updated: 2024/03/28 15:38:26 by mpeulet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Colors / base 16 / Bright

DEF_COLOR		= \033[0;39m
GREY			= \033[0;90m
RED				= \033[0;91m
GREEN			= \033[0;92m
YELLOW			= \033[0;93m
BLUE			= \033[0;94m
MAGENTA			= \033[0;95m
CYAN			= \033[0;96m
WHITE			= \033[0;97m
ORANGE			= \033[38;5;214m

PROJECT_DATA	= /home/${USER}/data/
MDB_VOLUME		= /home/${USER}/data/maridb
WP_VOLUME		= /home/${USER}/data/wp

all:
		@if [ ! -f .env ]; then \
			echo "[❌] .env file missing"; exit 1; \
		fi
		@echo "$(BLUE)"; cat ./tools/dockerart.txt; echo "$(DEF_COLOR)\n"
		@if [ ! -d $(MDB_VOLUME) ]; then \
			mkdir -p $(MDB_VOLUME); \
			@echo "$(YELLOW)local mariadb directory created.$(DEF_COLOR)"; \
		fi
		@if [ ! -d $(WP_VOLUME) ]; then \
			mkdir -p $(WP_VOLUME); \
			@echo "$(MAGENTA)local wordpress directory created.$(DEF_COLOR)"; \
		fi
		docker-compose -f ./srcs/docker-compose.yaml up -d --build
		@echo "$(GREEN)Built is complete. Service started.$(DEF_COLOR)"

build:
		docker-compose -f ./srcs/docker-compose.yaml build
		@echo "$(CYAN)Built is complete. You may start service.$(DEF_COLOR)"

images:
		@docker images

start:
		@docker-compose -f ./srcs/docker-compose.yaml start
		@echo "$(GREEN)Service is started.$(DEF_COLOR)"
stop:
		@docker-compose -f ./srcs/docker-compose.yaml stop
		@echo "$(ORANGE)Service is stopped.$(DEF_COLOR)"

clean:
		@docker-compose -f ./srcs/docker-compose.yaml down
		@echo "$(RED)Service was downed and removed.$(DEF_COLOR)"

fclean: clean
		@rm -rf $(PROJECT_DATA)
		@echo "$(RED)All local datas erased.$(DEF_COLOR)";
		docker rm $(docker ps -a -q)
		docker rmi $(docker images -q)
		docker volume prune -f
		docker network prune -f
		docker system prune -af

re: fclean all

.phony: all build images start stop clean fclean re
