# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: jhille <marvin@codam.nl>                     +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/29 16:15:51 by jhille        #+#    #+#                  #
#    Updated: 2021/02/14 17:51:38 by jhille        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
HEADER_FILE = libft.h
REG_FILES = ft_atoi.c\
		    ft_bzero.c\
		   	ft_calloc.c\
		   	ft_isalnum.c\
		   	ft_isascii.c\
			ft_isalpha.c\
		   	ft_isdigit.c\
		   	ft_isprint.c\
			ft_itoa.c\
			ft_uitoa.c\
		   	ft_memccpy.c\
		   	ft_memcpy.c\
		   	ft_memchr.c\
		   	ft_memcmp.c\
			ft_memmove.c\
		   	ft_memset.c\
		   	ft_putchar_fd.c\
			ft_putendl_fd.c\
			ft_putnbr_fd.c\
		   	ft_putstr_fd.c\
		   	ft_split.c\
		   	ft_strchr.c\
		   	ft_strdup.c\
			ft_strjoin.c\
			ft_strlcat.c\
		   	ft_strlcpy.c\
		   	ft_strlen.c\
		   	ft_strmapi.c\
		   	ft_strncmp.c\
		   	ft_strnstr.c\
		   	ft_strrchr.c\
		   	ft_strtrim.c\
		   	ft_substr.c\
		   	ft_tolower.c\
		   	ft_toupper.c\
			ft_resetptr.c
BONUS_FILES = ft_lstadd_back.c\
			  ft_lstadd_front.c\
			  ft_lstclear.c\
			  ft_lstdelone.c\
			  ft_lstiter.c\
			  ft_lstlast.c\
			  ft_lstmap.c\
			  ft_lstnew.c\
			  ft_lstsize.c
CFLAGS = -Wextra -Wall -Werror
REG_OBJ_FILES = $(REG_FILES:.c=.o)
BONUS_OBJ_FILES = $(BONUS_FILES:.c=.o)
ifdef WITH_BONUS
OBJ_FILES = $(REG_OBJ_FILES) $(BONUS_OBJ_FILES)
else
OBJ_FILES = $(REG_OBJ_FILES)
endif

all: $(NAME)

$(NAME): $(OBJ_FILES)
		ar -cr $@ $^

%.o: %.c $(HEADER_FILE)
		$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(REG_OBJ_FILES) $(BONUS_OBJ_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all

bonus:
	$(MAKE) WITH_BONUS=1 all

.PHONY: all clean fclean re bonus