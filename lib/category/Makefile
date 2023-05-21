.PHONY: all check clean fclean re test testlist
NAME = libfmtk_category.a
SUBDIR = subcategory
SUBLIB_NAME = $(foreach elem, $(SUBDIR), libfmtk_$(elem).a)
SUBLIB = $(foreach elem, $(SUBDIR), $(elem)/libfmtk_$(elem).a)
CLEAN_DIR = $(foreach elem, $(SUBDIR), clean-$(elem))
COUNT := 0

all: check $(NAME)

$(NAME) : $(SUBDIR) $(SUBLIB)
	@echo "create $(NAME)\n"$(addprefix addlib , $(addsuffix \\n, $(SUBLIB)))"save" | ar -M

check: $(SUBDIR) $(SUBLIB_NAME)

$(SUBDIR):
	@mkdir $@

$(SUBLIB_NAME): libfmtk_%.a:
	@make -sC $* all

clean:
	$(foreach elem, $(SUBDIR), @make -sC $(elem) fclean)

fclean: clean
	@rm -rf $(NAME)

re: fclean all

test-%: %
	@echo "--- category ($^) ---"
	@make -sC $^ test;

test: all
	@$(foreach elem, $(SUBDIR), $(eval COUNT := $(shell echo $$(($(COUNT) + 1))))echo "--- category$(COUNT) ($(elem)) ---";make -sC $(elem) test;)

testlist:
	@$(foreach elem, $(SUBDIR), echo $(elem);)
