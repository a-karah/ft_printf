NAME = libftprintf.a
LIBFT_NAME = libft.a
LIBFT_DIR = libft
SRCS = ft_printf.c print_nbr.c print_text.c print_nbr_utils.c
OBJS = $(SRCS:%.c=%.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

all: $(NAME)

$(NAME): $(LIBFT_DIR)/$(LIBFT_NAME) $(OBJS)
	ar -rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT_DIR)/$(LIBFT_NAME):
	@$(MAKE) -sC $(LIBFT_DIR)
	@cp $(LIBFT_DIR)/$(LIBFT_NAME) ./$(NAME)

bonus: $(LIBFT_DIR)/$(LIBFT_NAME) $(OBJS)
	ar -rcs $(NAME) $(OBJS)

clean:
	@$(MAKE) -sC $(LIBFT_DIR) clean
	$(RM) $(OBJS)

fclean: clean
	@$(MAKE) -sC $(LIBFT_DIR) fclean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
