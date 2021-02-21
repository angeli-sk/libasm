NAME = libasm.a

#FLAGS = -f elf64
FLAGS = -f macho64
DEBUG =  -g -F dwarf

CC = nasm

SRC = 	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s

OBJ =	$(SRC:%.s=%.o)

PINK	= 	\033[38;5;206m
PINK2	= \033[38;5;225m
WHITE	= \033[38;5;96m
X		= \033[38;5;
Y		= 1
Z		= m
TZE		= $(eval Y=$(shell echo $$((($(Y)%15)+1))))
LI		= 0
BLUE = \033[38;5;33m
RED = \033[38;5;160m
GREEN = \033[38;5;112m
RANDOM := $$((RANDOM % 10))

all: $(NAME)

%.o: %.s
	nasm $(FLAGS) $< -o $@

$(NAME):$(OBJ)
	@echo "$(X)$(Y)$(Z)✿	Compiling $@$(WHITE)\n"
	@ar -rcs $(NAME) $^
	# @ld $(OBJ) -o $(NAME)
	@echo "$(WHITE)--------------------------------"
	@echo "$(PINK2)✨	Compilation Done! $(WHITE)"

main: main.c
	@echo "$(X)$(Y)$(Z)✿	Compiling $@$(WHITE)\n"
	$(TZE)
	gcc main.c -I . -L . -lasm -Wall -Werror -Wextra
	@echo "$(WHITE)--------------------------------"
	@echo "$(PINK2)✨	Compilation Done! $(WHITE)"

clean:
	@echo "$(PINK)🦄	Cleaning ...$(WHITE)\n"
	rm -f $(OBJ) ./*.o
	rm -f ./*~ ./*#
	@echo "\n$(PINK2)✨	Cleaning Done!\n$(WHITE)"

fclean: clean
	@echo "$(PINK)🦄	Removing $(NAME) ...\n\n$(WHITE)"
	-rm -f $(NAME)
	@echo "\n$(PINK2)✨	Removed $(NAME)!$(WHITE)"
	@echo "$(WHITE)--------------------------------\n"

re: fclean all
