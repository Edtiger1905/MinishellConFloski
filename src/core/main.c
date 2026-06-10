/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: faiello <faiello@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/22 10:00:00 by faiello          #+#    #+#             */
/*   Updated: 2026/05/22 10:00:00 by faiello         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

volatile sig_atomic_t	g_signal = 0;

static void	consume_signal(void)
{
	if (g_signal == SIGINT)
	{
		*status_ref() = 130;
		g_signal = 0;
	}
}

static void	process_line(char *line)
{
	t_cmd	*pipeline;

	if (*line)
		add_history(line);
	pipeline = parse(line);
	if (!pipeline)
		return ;
	*status_ref() = run_pipeline(pipeline);
	cmd_free(pipeline);
}

static void	repl(int interactive)
{
	char	*line;

	while (1)
	{
		line = readline(MSH_PROMPT);
		consume_signal();
		if (!line)
		{
			if (interactive)
				write(STDOUT_FILENO, "exit\n", 5);
			break ;
		}
		process_line(line);
		free(line);
	}
}

int	main(void)
{
	signals_init();
	env_init();
	repl(isatty(STDIN_FILENO));
	rl_clear_history();
	return (*status_ref());
}
