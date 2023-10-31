lex-install:
	sudo apt install flex
bison-install:
	sudo apt install bison
dependencies:
	make lex-install
	make bison-install
lex-build:
	flex lexer.l
	$(COMPILER) lex.yy.c -o $(BINARY_NAME)
lex-run:
	./$(BINARY_NAME)
lex:
	make lex-build
	make lex-run
clean:
	@echo "Cleanning..."
	-rm -f $(BINARY_NAME)
	-rm -f lex.yy.c
	-rm -f parser.tab.c
	-rm -f parser.tan.h
bison:
	bison -d -t  parser.y

all:
	make bison
	make lex-build
	gcc lex.yy.c parser.tab.c


BINARY_NAME=output
COMPILER=gcc
