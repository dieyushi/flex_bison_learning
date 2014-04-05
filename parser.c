#include <stdio.h>
#include "yacc.h"

extern int yyparse();
extern FILE *yyin;

int main(int argc, char *argv[])
{
    if (argc != 2)
        return printf("Usage: %s filename", argv[0]);
	FILE* fp=fopen(argv[1], "r");
    if (!fp)
        return printf("can't open %s\n", argv[1]);
	yyin=fp;

	printf("---begin parsing %s---\n", argv[1]);
	yyparse();
	puts("---end parsing---");

	fclose(fp);
	return 0;
}
