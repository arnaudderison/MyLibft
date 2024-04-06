# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arnaud <arnaud@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/16 12:25:14 by arnaud            #+#    #+#              #
#    Updated: 2023/12/21 14:18:53 by arnaud           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Colors
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
CYAN=\033[0;36m
NC=\033[0m

# Libft sources
LIBFT_SRCS = $(wildcard src/**/*.c)
LIBFT_OBJS = $(LIBFT_SRCS:.c=.o)

# Compilation rules
all: $(NAME)

$(NAME): $(LIBFT_OBJS)
	@ar rcs $(NAME) $^
	@echo "${YELLOW}Library $(NAME) created.${NC}"

%.o: %.c
	@echo "${CYAN}Compiling $<...${NC}"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(LIBFT_OBJS)
	@echo "${GREEN}Object files cleaned.${NC}"

fclean: clean
	@rm -f $(NAME)
	@echo "${RED}All files removed.${NC}"

re: fclean all

.PHONY: all clean fclean re
