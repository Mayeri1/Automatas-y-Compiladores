%{
	#include<stdio.h>
	int lex ();
	 int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
	 yyrestart(stdin);
        return 0;
    }
%}

%% 
%token NUM MULTI EOL ;
%start statements;


statements : expression EOL { printf("= %d\n", $1); }
| error EOL { yyerror("Esta entrada no corresponde a una multiplicacion");  yyrestart(stdin); } // Si hay un error, mostramos el mensaje

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           |
	   | NUM MULTI NUM { $$ = $1 * $3; printf("Result *: %d\n", $$);}
	   

%%

int main () {
yyparse();
 yyrestart(stdin);
return 1;
}