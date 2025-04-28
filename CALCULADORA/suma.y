%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(const char *s);
%}

%union {
    int num;
}

%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE EOL
%type <num> expression term factor

%start statement

%%

statement:
    expression EOL  { printf("= %d\n", $1); }
    ;

expression:
      expression PLUS term    { $$ = $1 + $3; printf("+: %d\n", $$); }
    | expression MINUS term   { $$ = $1 - $3; printf("-: %d\n", $$); }
    | term                    { $$ = $1; }
    ;

term:
      term TIMES factor       { $$ = $1 * $3; printf("*: %d\n", $$); }
    | term DIVIDE factor      { 
                                  if ($3 != 0) { 
                                      $$ = $1 / $3; 
                                      printf("/: %d\n", $$); 
                                  } else {
                                      fprintf(stderr, "Error: División por cero\n");
                                      exit(1);
                                  }
                              }
    | factor                  { $$ = $1; }
    ;

factor:
      NUMBER                  { $$ = $1; printf("numero: %d\n", $$); }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error de sintaxis: %s\n", s);
}