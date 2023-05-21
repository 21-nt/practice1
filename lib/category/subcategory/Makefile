.PHONY : all clean fclean re test testlist
NAME = libfmtk_subcategory.a
SRC_DIR = src
SRC_NAME = 
SRC_PREFIX = string_
SRC_TMP = $(SRC_NAME:%=$(SRC_PREFIX)%)
SRC = $(SRC_TMP:%=$(SRC_DIR)/%.c)
INCLUDE = includes
OBJ_DIR = obj
OBJ = $(SRC_TMP:%=$(OBJ_DIR)/%.o)
ARFLAG = rc
CFLAG = -Wall -Werror -Wextra
LIB = -lfmtk_string
TEST_SRC = 
TEST_DIR = test
COUNT := 0

all : $(NAME)

$(NAME) : $(OBJ_DIR) $(OBJ)
	@$(AR) $(ARFLAG) $@ $(OBJ)

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

$(OBJ): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	@$(CC) $(CFLAG) -I $(INCLUDE) -c $^ -o $@

clean :
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -f $(NAME)

re : fclean all

test-%: $(TEST_DIR)/%.c
	@echo "-- test (src: $^) --"
	@$(CC) $^ -I $(INCLUDE) -L. $(LIB) && \
	(./a.out; rm ./a.out) || \
	echo error ; \
	echo "\n" 

test:
	@$(foreach elem, $(TEST_SRC), \
	$(eval COUNT := $(shell echo $$(($(COUNT) + 1)))) \
	echo "---- test$(COUNT) (src: $(elem)) ----"; \
	$(CC) $(TEST_DIR)/$(elem) -I $(INCLUDE) -L. $(LIB) && \
	./a.out || \
	echo error ; \
	echo "\n" ;)
	@rm -rf ./a.out

testlist:
	@$(foreach elem, $(TEST_SRC), echo $(elem);)
