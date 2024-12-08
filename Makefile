# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: raydogmu <raydogmu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 12:08:51 by raydogmu          #+#    #+#              #
#    Updated: 2024/10/26 14:58:55 by raydogmu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFILES = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
          ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c ft_memcpy.c ft_memmove.c \
          ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
          ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
          ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c \
          ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c ft_memcmp.c

BONUSFILES = ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c ft_lstclear_bonus.c \
		   ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstlast_bonus.c ft_lstmap_bonus.c \
		   ft_lstnew_bonus.c ft_lstsize_bonus.c

BONUS_OFILES = $(BONUSFILES:.c=.o)
OFILES = $(CFILES:.c=.o)
NAME = libft.a
CFLAGS = -Wall -Wextra -Werror -c

all: $(NAME)

$(NAME): $(OFILES)
	ar r $(NAME) $(OFILES)

bonus: $(BONUS_OFILES)
	ar r $(NAME) $(BONUS_OFILES)

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re