%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_NUMDEC 1
%}

%%
[0-9]+[.][0-9] { return TOKEN_NUMDEC; }
%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_NUMDEC )
			printf("token NUMERO DECIMAL RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}