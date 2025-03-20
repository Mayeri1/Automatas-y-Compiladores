%option noyywrap
%{
	#include<stdio.h>
	#define TOKEN_PALABRA_RESERVADA 1
	#define TOKEN_TIPO_DATO 2
	#define TOKEN_VARIABLE 3	
%}

%%
(return|if|else|while|for|switch|case) { return TOKEN_PALABRA_RESERVADA; }
(void|int|float|char|double|static) { return TOKEN_TIPO_DATO; }
[a-zA-Z_][a-zA-Z0-9_]* { return TOKEN_VARIABLE; }
%%
int main()
{
	int token;

	while (1) {
        token = yylex();
        if (token == TOKEN_PALABRA_RESERVADA)
            printf("Token PALABRA RESERVADA reconocido\n");
	
	if (token == TOKEN_TIPO_DATO)
            printf("Token TIPO DE DATO reconocido\n");

        if (token == TOKEN_VARIABLE)
            printf("Token VARIABLE reconocido\n");

	if ( token == 0)
	    break;
	}
	return 0;
}