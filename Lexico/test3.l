%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_VARIABLES 1
%}

%%
[a-z]+([_])?[a-zA-Z0-9]* { return TOKEN_VARIABLES; }
%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_VARIABLES )
			printf("token IDENTIFICADOR DE VARIABLES RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}