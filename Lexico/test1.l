%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_NUMENT 1
%}

%%
[0-9]+ { return TOKEN_NUMENT; }

%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_NUMENT )
			printf("token NUMERO ENTERO RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}