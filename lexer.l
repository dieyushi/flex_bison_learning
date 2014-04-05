%{
#include <stdio.h>
#include <string.h>
#include "yacc.h"
%}

%x COMMENT

%%
[_A-Za-z]([_A-Za-z]|[0-9])*     yylval.id_literal=strdup(yytext); return IDENTIFIER;
[0-9]+                          yylval.int_literal=atoi(yytext); return INTERGER;
([ \f\r\t\v]+)                  /* Ignore whitespace */
\n                              /* Ignore end of line*/
"//"                            printf("%s\n", "(comment)"); BEGIN COMMENT;
.                               yylval.op = strdup(yytext); return OPERATOR;
<COMMENT>\n                     BEGIN INITIAL;
<COMMENT>.                      /* Ignore any charset in comments */
%%
