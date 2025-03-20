%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_VERBO 1
%}

%%
(ejecutar|modificar|demostrar|ilustrar|interpretar|predecir|practicar|resolver|usar) { return TOKEN_VERBO; }
%%
int main()
{
	int token;
	while(1) {
		token = yylex();
		if (token == TOKEN_VERBO )
			printf("token VERBO DE LA TAXONOMÍA DE BLOOM RECONOCIDO\n");

	if ( token == 0)
		break;
	}
	return 0;
}