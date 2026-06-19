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


# ══════════════════════════════════════════════════════════════════════════════
#  🌈  C O L O R S   &   S T Y L E
# ══════════════════════════════════════════════════════════════════════════════

RESET          = \033[0m
BOLD           = \033[1m
DIM            = \033[2m
ITALIC         = \033[3m
UNDERLINE      = \033[4m
BLINK          = \033[5m

# ── Pride rainbow ─────────────────────────────────────────────────────────────
RED            = \033[38;5;196m
ORANGE         = \033[38;5;208m
YELLOW         = \033[38;5;226m
GREEN          = \033[38;5;46m
CYAN           = \033[38;5;51m
BLUE           = \033[38;5;33m
PURPLE         = \033[38;5;129m
PINK           = \033[38;5;213m
MAGENTA        = \033[38;5;201m
WHITE          = \033[38;5;231m
GRAY           = \033[38;5;245m

# ── Trans flag ────────────────────────────────────────────────────────────────
TRANS_BLUE     = \033[38;5;75m
TRANS_PINK     = \033[38;5;218m
TRANS_WHITE    = \033[38;5;231m

# ── Bi flag ───────────────────────────────────────────────────────────────────
BI_PINK        = \033[38;5;205m
BI_PURPLE      = \033[38;5;93m
BI_BLUE        = \033[38;5;27m

# ── Backgrounds ───────────────────────────────────────────────────────────────
BG_RED         = \033[48;5;196m
BG_ORANGE      = \033[48;5;208m
BG_YELLOW      = \033[48;5;226m
BG_GREEN       = \033[48;5;46m
BG_BLUE        = \033[48;5;33m
BG_PURPLE      = \033[48;5;129m


# ══════════════════════════════════════════════════════════════════════════════
#  🌈  A N I M A T I O N S
# ══════════════════════════════════════════════════════════════════════════════

define LOADING_ANIMATION
	@echo -n "$(CYAN)$(BOLD)  Loading$(RESET)"
	@for i in 1 2 3; do \
		echo -n "$(RAINBOW_DOT).$(RESET)"; \
		sleep 0.2; \
	done
	@echo ""
endef

define PROGRESS_BAR
	@echo -n "  $(BOLD)$(RED)▓$(ORANGE)▓$(YELLOW)▓$(GREEN)▓$(CYAN)▓$(BLUE)▓$(PURPLE)▓$(MAGENTA)▓$(PINK)▓$(RED)▓$(ORANGE)▓$(YELLOW)▓$(GREEN)▓$(CYAN)▓$(BLUE)▓$(PURPLE)▓$(MAGENTA)▓$(PINK)▓$(RED)▓$(ORANGE)▓$(RESET) "
	@echo "$(BOLD)$(GREEN)100%$(RESET)"
endef


# ══════════════════════════════════════════════════════════════════════════════
#  🏳️‍🌈  H E A D E R   S C R E E N
# ══════════════════════════════════════════════════════════════════════════════

define PRIDE_HEADER
	@clear
	@echo ""
	@echo "$(BOLD)$(RED)  ╔═══════════════════════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(RED)  ║$(ORANGE)                                                                               $(RED)║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║$(YELLOW)  ███╗   ███╗██╗███╗  ██╗██╗███████╗██╗  ██╗███████╗██╗     ██╗             $(ORANGE)║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║$(GREEN)  ████╗ ████║██║████╗ ██║██║██╔════╝██║  ██║██╔════╝██║     ██║             $(YELLOW)║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║$(CYAN)  ██╔████╔██║██║██╔██╗██║██║███████╗███████║█████╗  ██║     ██║             $(GREEN)║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║$(BLUE)  ██║╚██╔╝██║██║██║╚████║██║╚════██║██╔══██║██╔══╝  ██║     ██║             $(CYAN)║$(RESET)"
	@echo "$(BOLD)$(BLUE)  ║$(PURPLE)  ██║ ╚═╝ ██║██║██║ ╚███║██║███████║██║  ██║███████╗███████╗███████╗        $(BLUE)║$(RESET)"
	@echo "$(BOLD)$(PURPLE)  ║$(MAGENTA)  ╚═╝     ╚═╝╚═╝╚═╝  ╚══╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝        $(PURPLE)║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║$(PINK)                                                                               $(MAGENTA)║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║$(RED)        $(RED)🏳️‍🌈  $(ORANGE)L  $(YELLOW)O  $(GREEN)V  $(CYAN)E  $(BLUE)I  $(PURPLE)S  $(MAGENTA)L  $(PINK)O  $(RED)V  $(ORANGE)E  $(YELLOW)🏳️‍🌈$(PINK)                              $(PINK)║$(RESET)"
	@echo "$(BOLD)$(RED)  ║$(ORANGE)                                                                               $(RED)║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║$(YELLOW)        $(TRANS_PINK)BUILD SYSTEM v1.0$(YELLOW)  ·  $(TRANS_BLUE)42 School Edition$(YELLOW)  ·  $(TRANS_WHITE)be yourself 🏳️‍⚧️$(YELLOW)               $(ORANGE)║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║$(GREEN)                                                                               $(YELLOW)║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ╚═══════════════════════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
	@sleep 1
endef


# ══════════════════════════════════════════════════════════════════════════════
#  ✅  S U C C E S S   S C R E E N
# ══════════════════════════════════════════════════════════════════════════════

define SUCCESS_SCREEN
	@echo ""
	@echo "$(BOLD)$(GREEN)  ╔═══════════════════════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║         COMPILATION COMPLETED — YOU ARE VALID AND SO IS YOUR CODE            ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗███████╗███████╗  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗███████╗███████╗  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║╚════██║╚════██║  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║███████║███████║  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝  ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║   $(YELLOW)🌈  $(NAME) is ready to run · you are seen · you are loved 🌈$(GREEN)          ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(GREEN)  ╚═══════════════════════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
endef


# ══════════════════════════════════════════════════════════════════════════════
#  🧹  C L E A N   S C R E E N
# ══════════════════════════════════════════════════════════════════════════════

define CLEAN_SCREEN
	@echo ""
	@echo "$(BOLD)$(ORANGE)  ╔═══════════════════════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║                    SWEEPING THE GLITTER OFF THE FLOOR 🧹✨                   ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║   ██████╗██╗     ███████╗ █████╗ ███╗  ██╗██╗███╗  ██╗ ██████╗              ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║  ██╔════╝██║     ██╔════╝██╔══██╗████╗ ██║██║████╗ ██║██╔════╝              ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║  ██║     ██║     █████╗  ███████║██╔██╗██║██║██╔██╗██║██║  ███╗             ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║  ██║     ██║     ██╔══╝  ██╔══██║██║╚████║██║██║╚████║██║   ██║             ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║  ╚██████╗███████╗███████╗██║  ██║██║ ╚███║██║██║ ╚███║╚██████╔╝             ║$(RESET)"
	@echo "$(BOLD)$(YELLOW)  ║   ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚══╝╚═╝╚═╝  ╚══╝ ╚═════╝             ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║   $(RED)🔴 $(ORANGE)🟠 $(YELLOW)🟡 $(GREEN)🟢 $(BLUE)🔵 $(PURPLE)🟣$(ORANGE)  The slate is clean — a fresh start awaits you          ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(ORANGE)  ╚═══════════════════════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
endef


# ══════════════════════════════════════════════════════════════════════════════
#  🔄  R E B U I L D   S C R E E N
# ══════════════════════════════════════════════════════════════════════════════

define REBUILD_SCREEN
	@echo ""
	@echo "$(BOLD)$(MAGENTA)  ╔═══════════════════════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║        🏳️‍🌈  REBORN — BECAUSE REINVENTING YOURSELF IS ALWAYS VALID  🏳️‍🌈       ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ██████╗ ███████╗██████╗  ██████╗ ██████╗ ███╗  ██╗                         ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔══██╗████╗ ██║                         ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ██████╔╝█████╗  ██████╔╝██║   ██║██████╔╝██╔██╗██║                         ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ██╔══██╗██╔══╝  ██╔══██╗██║   ██║██╔══██╗██║╚████║                         ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ██║  ██║███████╗██████╔╝╚██████╔╝██║  ██║██║ ╚███║                         ║$(RESET)"
	@echo "$(BOLD)$(PINK)  ║   ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚══╝                         ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║   $(TRANS_PINK)Starting fresh compilation cycle...$(MAGENTA)                                      ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(MAGENTA)  ╚═══════════════════════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
	@sleep 1
endef


# ══════════════════════════════════════════════════════════════════════════════
#  📖  H E L P   S C R E E N
# ══════════════════════════════════════════════════════════════════════════════

define HELP_SCREEN
	@echo ""
	@echo "$(BOLD)$(CYAN)  ╔═══════════════════════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║                   🌈  MAKEFILE COMMAND REFERENCE  🌈                         ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(GREEN)make$(CYAN)  /  $(GREEN)make all$(CYAN)    →  Compile $(NAME) and all dependencies            ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(YELLOW)make clean$(CYAN)         →  Remove all object files                          ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(ORANGE)make fclean$(CYAN)        →  Remove objects + executable                      ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(MAGENTA)make re$(CYAN)            →  Full rebuild (fclean + all)                      ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(BLUE)make help$(CYAN)          →  Show this glorious help screen                  ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║   $(TRANS_PINK)🏳️‍⚧️  You are valid. Your code is valid. Keep going.  🏳️‍⚧️$(CYAN)               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ║                                                                               ║$(RESET)"
	@echo "$(BOLD)$(CYAN)  ╚═══════════════════════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
endef


# ══════════════════════════════════════════════════════════════════════════════
#  📁  S O U R C E S
# ══════════════════════════════════════════════════════════════════════════════

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


# ══════════════════════════════════════════════════════════════════════════════
#  🎯  R U L E S
# ══════════════════════════════════════════════════════════════════════════════

all: header $(LIBFT) $(LIBPRINTF) $(NAME)
	@$(call PROGRESS_BAR)
	@$(call SUCCESS_SCREEN)


header:
	@$(call PRIDE_HEADER)


$(NAME): $(OBJECTS)
	@echo ""
	@echo "$(BOLD)$(MAGENTA)  Linking $(NAME)...$(RESET)"
	@$(call LOADING_ANIMATION)
	@$(CC) $(CFLAGS) $(OBJECTS) -L$(LIBFT_DIR) -lft -L$(PRINTF_DIR) -lftprintf \
		$(LDFLAGS) $(LDLIBS) -o $@
	@echo "$(BOLD)$(GREEN)  ✓ $(NAME) linked$(RESET)"


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@echo -n "$(GRAY)  compiling $< $(RESET)"
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	@echo "$(BOLD)$(GREEN)✓$(RESET)"


$(LIBFT):
	@echo "$(BOLD)$(BI_PINK)  building libft...$(RESET)"
	@$(call LOADING_ANIMATION)
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR)
	@echo "$(BOLD)$(BI_BLUE)  ✓ libft ready$(RESET)"


$(LIBPRINTF):
	@echo "$(BOLD)$(BI_PURPLE)  building libftprintf...$(RESET)"
	@$(call LOADING_ANIMATION)
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR)
	@echo "$(BOLD)$(BI_BLUE)  ✓ libftprintf ready$(RESET)"


clean:
	@$(call CLEAN_SCREEN)
	@$(call LOADING_ANIMATION)
	@rm -rf $(OBJ_DIR)
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR) clean
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR) clean
	@echo "$(BOLD)$(GREEN)  ✓ object files removed$(RESET)"


fclean: clean
	@echo "$(BOLD)$(RED)  Executing deep cleanup — out with the old, in with the new 🌈$(RESET)"
	@$(call LOADING_ANIMATION)
	@rm -f $(NAME)
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR) fclean
	@$(MAKE) --no-print-directory -C $(PRINTF_DIR) fclean
	@echo "$(BOLD)$(GREEN)  ✓ executables removed$(RESET)"


re: fclean
	@$(call REBUILD_SCREEN)
	@$(MAKE) all


help:
	@$(call HELP_SCREEN)


.PHONY: all header clean fclean re help