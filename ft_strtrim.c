/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: raydogmu <raydogmu@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/12 13:07:14 by raydogmu          #+#    #+#             */
/*   Updated: 2024/10/21 16:59:45 by raydogmu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	controller(const char s1, char const *set)
{
	int	i;

	i = 0;
	while (set[i])
	{
		if (s1 == set[i])
			return (1);
		i++;
	}
	return (0);
}

static int	last_size(char const *s1, char const *set)
{
	size_t	i;
	size_t	cut;

	i = 0;
	cut = 0;
	while (s1[i])
	{
		if (!controller(s1[i], set))
			break ;
		cut++;
		i++;
	}
	if (ft_strlen(s1) == cut)
		return (0);
	i = ft_strlen(s1) - 1;
	while (i >= 0)
	{
		if (!controller(s1[i], set))
			break ;
		cut++;
		i--;
	}
	if (ft_strlen(s1) - cut == 0)
		return (0);
	return (ft_strlen(s1) - cut);
}

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*text;
	size_t	i;
	int		j;
	int		flag;
	int		added;

	i = -1;
	j = 0;
	flag = 0;
	added = 0;
	text = malloc(last_size(s1, set) + 1);
	if (text == NULL)
		return (NULL);
	while (s1[++i] && added != last_size(s1, set))
	{
		if (controller(s1[i], set) && !flag)
			continue ;
		flag = 1;
		text[j] = s1[i];
		j++;
		added++;
	}
	text[j] = '\0';
	return (text);
}
