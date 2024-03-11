# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paescano <paescano@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/06 14:58:51 by paescano          #+#    #+#              #
#    Updated: 2024/03/07 12:08:52 by paescano         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#colors
Y = \033[33m
R = \033[31m
G = \033[32m
B = \033[34m
P = \033[35m
C = \033[36m
X = \033[0m

#docker-compose file
DCFILE=srcs/docker-compose.yml
#user
USER=paescano

all : credit build run

build :
	@echo "$(Y)███████████████████ Making Inception Containers ████████████████████$(X)"
	@test -d /home/$(USER)/data/wordpress || mkdir -p /home/$(USER)/data/wordpress
	@test -d /home/$(USER)/data/mariadb || mkdir -p /home/$(USER)/data/mariadb
	@docker-compose -f $(DCFILE) build
	@echo "$(G)█████████████████████ Build Inception is DONE ██████████████████████$(X)"

run :
	@echo "$(Y)███████████████████ Running Inception Containers ███████████████████$(X)"
	@docker-compose -f $(DCFILE) up -d
	@echo "$(G)███████████████████ Inception are up and running ███████████████████$(X)"

stop :
	@echo "$(R)███████████████████ Stopping Inception Containers ██████████████████$(X)"
	@docker-compose -f $(DCFILE) stop
	@echo "$(G)█████████████████████ Inception are stopped ████████████████████████$(X)"

down :
	@echo "$(R)███████████████████ Removing Inception Containers ██████████████████$(X)"
	@docker-compose -f $(DCFILE) down
	@echo "$(G)█████████████████████ Inception are down ███████████████████████████$(X)"

clean :
	@echo "$(R)███████████████████ Cleaning Inception Containers ██████████████████$(X)"
	@docker system prune -a
	@echo "$(G)█████████████████████ Inception are cleaned ████████████████████████$(X)"

re : down build run

rec : down clean build run

credit:
	@echo "$(R)██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗$(X)"
	@echo "$(Y)██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║$(X)"
	@echo "$(C)██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║$(X)"
	@echo "$(B)██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║$(X)"
	@echo "$(P)██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║$(X)"
	@echo "$(G)╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝$(X)"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━┃          $(R)pa$(Y)e$(C)s$(B)c$(P)a$(G)no         $(X) ┃━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

.PHONY: all build run stop down clean re rec
