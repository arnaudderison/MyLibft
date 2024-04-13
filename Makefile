# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aderison <aderison@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/16 12:25:14 by arnaud            #+#    #+#              #
#    Updated: 2024/04/13 13:27:14 by aderison         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = gcc
OBJ_DIR = obj
CFLAGS = -Wall -Wextra -Werror

# Colors
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
CYAN=\033[0;36m
NC=\033[0m

# Libft sources
LIBFT_SRCS = $(wildcard src/**/*.c)
LIBFT_OBJS = $(LIBFT_SRCS:%c=obj/%o)

# Compilation rules
all: $(NAME)

$(NAME): $(LIBFT_OBJS)
	@ar rcs $(NAME) $^
	@echo "${YELLOW}Library $(NAME) created.${NC}"

obj/%.o: %.c
	@mkdir -p $(dir $@)
	@echo -n "\r${CYAN}Compiling $<...${NC}"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf obj
	@echo "${GREEN}Object files cleaned.${NC}"

fclean: clean
	@rm -r libft.a
	@echo "${RED}All files removed.${NC}"

re: fclean all

.PHONY: all clean fclean re
