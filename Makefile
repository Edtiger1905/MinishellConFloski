# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faiello <faiello@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/05/22 10:00:00 by faiello          #+#    #+#              #
#    Updated: 2026/05/22 10:00:00 by faiello         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       := minishell

SRC_DIR    := src
INC_DIR    := include
OBJ_DIR    := build
LIBFT_DIR  := libft
PRINTF_DIR := printf

LIBFT      := $(LIBFT_DIR)/libft.a
LIBPRINTF  := $(PRINTF_DIR)/libftprintf.a

CC         := cc
CFLAGS     := -Wall -Wextra -Werror
INCLUDES   := -I$(INC_DIR) -I$(LIBFT_DIR) -I$(PRINTF_DIR)

UNAME_S    := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	RL_PREFIX := $(shell brew --prefix readline 2>/dev/null)
	ifneq ($(RL_PREFIX),)
		INCLUDES += -I$(RL_PREFIX)/include
		LDFLAGS  += -L$(RL_PREFIX)/lib
	endif
endif
LDLIBS     := -lreadline

# ── Colori ──────────────────────────────────────────────────────────────────
RESET  := \033[0m
BOLD   := \033[1m
GREEN  := \033[0;32m
CYAN   := \033[0;36m
YELLOW := \033[0;33m
RED    := \033[0;31m
GRAY   := \033[0;90m

SOURCES := \
	src/core/main.c \
	src/core/signals.c \
	src/core/signals_modes.c \
	src/core/state.c \
	src/lex/lex_main.c \
	src/lex/lex_word.c \
	src/lex/lex_op.c \
	src/quote/quote_main.c \
	src/quote/quote_step.c \
	src/quote/quote_escape.c \
	src/expand/expand_main.c \
	src/expand/expand_dollar.c \
	src/parser/parser_main.c \
	src/parser/parser_syntax.c \
	src/parser/parser_cmd.c \
	src/parser/parser_build.c \
	src/parser/parser_walk.c \
	src/parser/parser_redir.c \
	src/parser/parser_hdoc.c \
	src/parser/parser_hdoc_read.c \
	src/parser/parser_hdoc_stage.c \
	src/parser/parser_hdoc_run.c \
	src/env/env_init.c \
	src/env/env_get.c \
	src/env/env_set.c \
	src/env/env_unset.c \
	src/exec/exec_main.c \
	src/exec/exec_multi.c \
	src/exec/exec_status.c \
	src/exec/exec_pipes.c \
	src/exec/exec_spawn.c \
	src/exec/exec_child.c \
	src/exec/exec_child_pipes.c \
	src/exec/exec_path.c \
	src/exec/exec_path_utils.c \
	src/builtins/bi_echo.c \
	src/builtins/bi_cd.c \
	src/builtins/bi_pwd.c \
	src/builtins/bi_env.c \
	src/builtins/bi_exit.c \
	src/builtins/bi_export.c \
	src/builtins/bi_export_print.c \
	src/builtins/bi_unset.c \
	src/builtins/bi_table.c \
	src/builtins/bi_dispatch.c \
	src/utils/free_utils.c

OBJECTS := $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# ── Regole ──────────────────────────────────────────────────────────────────

all: _header $(NAME)
	@echo "$(BOLD)$(GREEN)  ✔  $(NAME) pronto!$(RESET)"

_header:
	@echo ""
	@echo "$(BOLD)$(CYAN)  ╔══════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║     building minishell       ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ╚══════════════════════════════╝$(RESET)"
	@echo ""

$(NAME): $(LIBFT) $(LIBPRINTF) $(OBJECTS)
	@echo "$(YELLOW)  linking  →  $@$(RESET)"
	@$(CC) $(CFLAGS) $(OBJECTS) -L$(LIBFT_DIR) -lft -L$(PRINTF_DIR) -lftprintf \
		$(LDFLAGS) $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@echo "$(GRAY)  compile  →  $<$(RESET)"
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(LIBFT):
	@echo "$(CYAN)  building libft...$(RESET)"
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR)

$(LIBPRINTF):
	@echo "$(CYAN)  building libftprintf...$(RESET)"
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR)

clean:
	@echo "$(YELLOW)  cleaning objects...$(RESET)"
	@rm -rf $(OBJ_DIR)
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR) clean
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR) clean
	@echo "$(GREEN)  ✔  oggetti rimossi$(RESET)"

fclean: clean
	@echo "$(YELLOW)  removing $(NAME)...$(RESET)"
	@rm -f $(NAME)
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR) fclean
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR) fclean
	@echo "$(GREEN)  ✔  tutto ripulito!$(RESET)"
re: fclean all

.PHONY: all clean fclean re _header