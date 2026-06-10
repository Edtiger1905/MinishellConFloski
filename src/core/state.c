/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   state.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: faiello <faiello@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/22 10:00:00 by faiello          #+#    #+#             */
/*   Updated: 2026/05/22 10:00:00 by faiello         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

int	*status_ref(void)
{
	static int	last_status;

	return (&last_status);
}

char	***env_ref(void)
{
	static char	**env_store;

	return (&env_store);
}
