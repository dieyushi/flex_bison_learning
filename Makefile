LEX=flex
YACC=bison
CC=gcc
OBJECT=parser

$(OBJECT): parser.c yacc.c yacc.h lexer.c lexer.h
	$(CC) parser.c yacc.c lexer.c -o $(OBJECT)

yacc.c yacc.h: yacc.y
	$(YACC) -d -o yacc.c yacc.y

lexer.c lexer.h: lexer.l
	$(LEX) -o lexer.c --header-file="lexer.h" lexer.l

clean:
	@rm -f $(OBJECT) yacc.c yacc.h lexer.c lexer.h *.gch

