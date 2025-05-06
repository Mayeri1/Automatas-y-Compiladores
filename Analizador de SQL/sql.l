%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
#include "y.tab.h"
%}

%option noyywrap

%%

"SELECT"        return SELECT;
"FROM"          return FROM;
"WHERE"         return WHERE;
"AND"           return AND;
"OR"            return OR;
"DELETE"        return ELIMINAR;
"UPDATE"        return ACTUALIZAR;
"SET"           return ESTABLECER;
"INSERT"        return INSERTAR;
"INTO"          return EN;
"VALUES"        return VALORES;

"*"             return ASTERISCO;
","             return COMA;
"="             return IGUAL;
"<"             return MENOR;
">"             return MAYOR;
";"             return PUNTO_Y_COMA;
"("             return PARENTESIS_ABIERTO;
")"             return PARENTESIS_CERRADO;

[a-zA-Z_][a-zA-Z0-9_]*  { yylval.Mystr = strdup(yytext); return IDENTIFIER; }
[0-9]+            { yylval.Mystr = strdup(yytext); return CONST; }

\n               { return NL; }

[ \t]+        

%%

