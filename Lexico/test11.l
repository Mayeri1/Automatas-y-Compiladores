%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_COMENTARIO 1
	#define TOKEN_TEXTO 2
%}

%%
\/\/.* { return TOKEN_COMENTARIO; }
\"[^\"]*\" { return TOKEN_TEXTO; }
 
%%
int main()
{
	int token;

	while (1) {
        token = yylex();
        if (token == TOKEN_COMENTARIO)
            printf("token COMENTARIO reconocido\n");
        if (token == TOKEN_TEXTO)
            printf("token TEXTO EN LINEA reconocido\n");
        if (token == 0)
            break;
    }
	return 0;
}