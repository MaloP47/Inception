# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpeulet <mpeulet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 09:13:18 by mpeulet           #+#    #+#              #
#    Updated: 2024/03/28 14:18:11 by mpeulet          ###   ########.fr        #
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

MDB_VOLUME		= /home/${USER}/data/maridb
WP_VOLUME		= /home/${USER}/data/wp

all:
		@if [ ! -f .env ]; then \
			echo "[❌] .env file missing"; exit 1; \
		fi
		@echo "$(BLUE)"; cat ./tools/dockerart.txt; echo "$(DEF_COLOR)\n"
		@if [ ! -d $(MDB_VOLUME) ]; then \
			mkdir -p $(MDB_VOLUME); \
			echo "$(BLUE)mariadb volume created.$(DEF_COLOR)"; \
		fi

clean:

fclean:
		rm -rf /home/mpeulet/data/database/*
		rm -rf /home/mpeulet/data/files/*
		docker system prune -af

re: fclean all

.phony: all clean fclean re
