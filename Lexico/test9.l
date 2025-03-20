%option noyywrap
%{
	#include<stdio.h>
	#include<C:\Flex Windows\EditPlusPortable\token.h>
%}

%%
(diferenciar|examinar|comparar|contrastar|inferir|experimentar|indagar) { return TOKEN_ANALIZAR; }
(bueno|lindo|inteligente|creativo) { return TOKEN_ADJETIVO; }
(y|o|pero|aunque|sino) { return TOKEN_CONJUNCION; }
(en|con|sin|bajo|sobre) { return TOKEN_PREPOSICION; }
(yo|tú|él|ella|nosotros|ustedes|ellos) { return TOKEN_PRONOMBRE; }
%%
int main()
{
	    int token;
    while (1) {
        token = yylex();
        if (token == TOKEN_ANALIZAR)
            printf("Token ANALIZAR reconocido\n");

        if (token == TOKEN_ADJETIVO)
            printf("Token ADJETIVO reconocido\n");

        if (token == TOKEN_CONJUNCION)
            printf("Token CONJUNCION reconocido\n");

        if (token == TOKEN_PREPOSICION)
            printf("Token PREPOSICION reconocido\n");
        
        if (token == TOKEN_PRONOMBRE)
            printf("Token PRONOMBRE reconocido\n");
        
        if (token == 0)
            break;
    }
    return 0;
}