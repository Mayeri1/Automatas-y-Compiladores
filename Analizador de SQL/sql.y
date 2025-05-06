%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "struct.h"

int yylex();
int yyerror(char *s) {
    printf("  -- ERROR --  %s\n", s);
    return 0;
}

symbtbl *ptr;
%}

%union {
    int numerorighe;
    char *Mystr;
}

%token <Mystr> IDENTIFIER CONST
%token SELECT FROM WHERE AND OR ELIMINAR ACTUALIZAR ESTABLECER INSERTAR EN VALORES
%token <Mystr> ASTERISCO COMA IGUAL MENOR MAYOR PUNTO_Y_COMA PARENTESIS_ABIERTO PARENTESIS_CERRADO
%token NL

%type <Mystr> identifiers columns values compare cond op

%%

lines:
      /* empty */
    | lines line
    | lines error ';'
;

line:
      SELECT identifiers FROM IDENTIFIER WHERE cond PUNTO_Y_COMA {
          ptr = putsymb($2, $4, 0);
      }
    | INSERTAR EN IDENTIFIER PARENTESIS_ABIERTO columns PARENTESIS_CERRADO VALORES PARENTESIS_ABIERTO values PARENTESIS_CERRADO PUNTO_Y_COMA {
          ptr = putinsertsymb($5, $3, $9, 0);
      }
    | ELIMINAR DESDE IDENTIFIER WHERE cond PUNTO_Y_COMA {
          ptr = putdeletesymb($3, 0);
      }
;

columns:
      IDENTIFIER                   { $$ = $1; }
    | IDENTIFIER COMA columns {
          char *s = malloc(strlen($1) + strlen($3) + 2);
          strcpy(s, $1); strcat(s, ","); strcat(s, $3);
          $$ = s;
      }
;

values:
      CONST                      { $$ = $1; }
    | CONST COMA values {
          char *s = malloc(strlen($1) + strlen($3) + 2);
          strcpy(s, $1); strcat(s, ","); strcat(s, $3);
          $$ = s;
      }
;

identifiers:
      ASTERISCO                        { $$ = strdup("*"); }
    | IDENTIFIER                       { $$ = $1; }
    | IDENTIFIER COMA identifiers {
          char *s = malloc(strlen($1) + strlen($3) + 2);
          strcpy(s, $1); strcat(s, ","); strcat(s, $3);
          $$ = s;
      }
;

cond:
      IDENTIFIER op compare             { $$ = strdup("COND"); }
    | IDENTIFIER op compare AND cond   { $$ = strdup("COND"); }
    | IDENTIFIER op compare OR cond    { $$ = strdup("COND"); }
;

compare:
      IDENTIFIER   { $$ = $1; }
    | CONST        { $$ = $1; }
;

op:
      MENOR          { $$ = strdup("<"); }
    | IGUAL          { $$ = strdup("="); }
    | MAYOR          { $$ = strdup(">"); }
;

%%

int main() {
  FILE* del;
char filename[] = "results.txt";
del = fopen(filename,"a");
remove(filename);
yyparse();
return 0;
}

