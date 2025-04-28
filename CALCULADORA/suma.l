
%{
	#include<stdio.h>
	#include "y.tab.h"
	extern YYSTYPE yylval;
%}

%%
[0-9]+    { yylval.num = atoi(yytext); return NUMBER; }
"+"	{ return PLUS; }
"-"	{ return MINUS; }
"*"	{ return TIMES; }
"/"	{ return DIVIDE; }
"\n"	{ return EOL; }
[ \t\f\v] {}
.         { return *yytext; }
%%

int yywrap(void)
{
	return 1;
}
