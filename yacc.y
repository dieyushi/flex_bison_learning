%{
#include <stdio.h>
#include "lexer.h"

void yyerror(const char *str)
{
    fprintf(stderr, "Parse error: %s\n", str);
}
int yywrap()
{
    return 1;
}
%}

%union {
    char *id_literal;
    int int_literal;
    char *op;
}

%token<id_literal>IDENTIFIER
%token<int_literal>INTERGER
%token<op>OPERATOR

%%

tokenlist:
    {
    }
    | tokenlist INTERGER
    {
        printf("int: %d\n", $2);
    }
    | tokenlist IDENTIFIER
    {
        printf("id: %s\n", $2);
    }
    | tokenlist OPERATOR
    {
        printf("op: %s\n", $2);
    };

%%

