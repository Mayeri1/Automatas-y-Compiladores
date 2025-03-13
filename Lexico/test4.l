%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_RFC 1
%}

%%
[A-Za-z]{4}[0-9]{2}([0][1-9]|[1][0-2])([0][1-9]|[1][0-9]|[2][0-1]|[3][0-1])[0-9A-Z]{4} { return TOKEN_RFC; }
%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_RFC )
			printf("token RFC RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}