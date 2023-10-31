lex-compile:
	flex flex.l
	gcc lex.yy.c -o $(BINARY_NAME)
lex-run:
	./$(BINARY_NAME)
lex:
	make lex-compile
	make lex-run
clean:
	@echo "Cleanning..."
	-rm -f $(BINARY_NAME)
	-rm -f lex.yy.c


BINARY_NAME=output
