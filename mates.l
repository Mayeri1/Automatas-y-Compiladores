%option noyywrap
%{
	#include<stdio.h>
	#include <string.h>
	#include <ctype.h>

	int count_lineas = 0;
	int count_palabras = 0;
	int count_caracteres = 0;
	int count_ni = 0;
	int count_num = 0;
	int count_b_to = 0;
	int count_jo = 0;
	int count_digitos = 0;
%}

%%
\n { count_lineas++; }
[a-zA-z0-9]+ { count_palabras++; }
[,|.|:|;|"]+ { count_caracteres++; }
[NI|ni]+[a-zA-Z]* { count_ni++; }
[NUM|num]+[a-zA-Z]* { count_num++; }
[bB][a-zA-Z]*to { count_b_to++, }
[a-zA-Z]+[jo|JO]* { count_jo++; }
[0-9] { count_digitos++; }
%%
int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf("Uso: %s <archivo.txt>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("No se puede abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex(); 

	printf("Total de lineas: %d\n", count_lineas);
	printf("Total de palabras: %d\n", count_palabras);
	printf("Total de caracteres (incluyendo espacios): %d\n", count_caracteres);
	printf("Total de palabras que empiezan con 'ni': %d\n", count_ni);
	printf("Total de palabras que empiezan con 'num': %d\n", count_num);
	printf("Total de palabras que empiezan con 'b' y terminan con 'to': %d\n", count_b_to);
	printf("Total de palabras que terminan con 'jo': %d\n", count_jo);
	printf("Total de digitos: %d\n", count_digitos);

	fclose(file);
	return 0;
}