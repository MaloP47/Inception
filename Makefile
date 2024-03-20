# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpeulet <mpeulet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/18 09:13:18 by mpeulet           #+#    #+#              #
#    Updated: 2024/03/18 12:05:30 by mpeulet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		mkdir -p /home/mpeulet/data/database
		mkdir -p /home/mpeulet/data/files

clean:

fclean:
		rm -rf /home/mpeulet/data/database/*
		rm -rf /home/mpeulet/data/files/*
		docker system prune -af

re: fclean

.phony: all clean fclean re
