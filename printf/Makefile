# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faiello <faiello@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/23 15:45:27 by faiello          #+#    #+#              #
#    Updated: 2025/07/04 14:01:29 by faiello         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME    = libftprintf.a
OBJ_DIR = obj
CC      = gcc
CFLAGS  = -Wall -Wextra -Werror

SRCS = ft_printf.c ft_printf_fun.c ft_printf_u.c ft_printf_p.c \
       ft_printf_esa.c ft_printf_fd.c ft_printf_fd_utils.c

OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re