/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exec_multi.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: faiello <faiello@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/22 10:00:00 by faiello          #+#    #+#             */
/*   Updated: 2026/05/22 10:00:00 by faiello         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

int	run_multi(t_cmd *list, int n)
{
	int		**pipes;
	pid_t	*pids;

	pipes = alloc_pipes(n);
	if (n > 1 && !pipes)
		return (1);
	pids = (pid_t *)malloc(sizeof(pid_t) * n);
	if (!pids)
	{
		pipes_free(pipes, n);
		return (1);
	}
	signals_silence_parent();
	spawn_all(list, pipes, pids, n);
	pipes_close_all(pipes, n);
	wait_all(pids, n);
	signals_init();
	pipes_free(pipes, n);
	free(pids);
	return (*status_ref());
}
