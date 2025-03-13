%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_CURP 1
%}

%%
[A-Z]{4}[0-9]{2}([0][1-9]|[1][0-2])([0][1-9]|[1][0-9]|[2][0-1]|[3][0-1])[H|M][A-Z]{2}[0-9A-Z]{5} { return TOKEN_CURP; }
%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_CURP )
			printf("token CURP RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}