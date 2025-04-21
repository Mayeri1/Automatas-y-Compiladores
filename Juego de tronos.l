%option noyywrap

%{
	#include<stdio.h>
	#include <string.h>
	#include <ctype.h>
	int west = 0;
	int inver = 0;
	int desem_rey = 0;
	int nido_agui = 0;
	int alto = 0;
	int aguas = 0;
	int roca_dra= 0;
	int roca_cas = 0;
	int bast = 0;
	int dorne = 0;

	//casas
	int stark= 0;
	int arryn = 0;
	int tully = 0;
	int greyjoy = 0;
	int lannister = 0;
	int tyrell = 0;
	int martell = 0;
	int baratheon = 0;
	int targaryen = 0;
	int eddard = 0;
	int catelyn = 0;
	int arya = 0;
	int sansa = 0;
	int robert = 0;
	int joffrey = 0;
	int stannis = 0;
	int aegon = 0;
	int daenerys = 0;
	int aerys = 0;
	int tywin = 0;
	int jaime = 0;
	int tyrion = 0;
	int cersei = 0;
%}

%%

Westeros          { west++; }//Lugares
Invernalia        { inver++; }
"Desembarco del Rey" { desem_rey++; }
"Nido ""de "(\xc3\x81|A)"guilas" { nido_agui++; }
"Altojard"(\xc3\xad|i)"n" { alto++; }
Aguasdulces       { aguas++; }
"Rocadrag"(\xc3\xb3|o)"n" { roca_dra++; }
"Roca Casterly"   { roca_cas++; }
"de Tormentas"    { bast++; }
Dorne             { dorne++; }

[Ss]tark          { stark++; }//Casas
Arryn             { arryn++; }
Tully             { tully++; }
Greyjoy           { greyjoy++; }
Lannister         { lannister++; }
Tyrell            { tyrell++; }
Martell           { martell++; }
Baratheon         { baratheon++; }
Targaryen         { targaryen++; }

Eddard            { eddard++; }//Personajes
Catelyn            { catelyn++; }
[Aa]rya              { arya++; }
Sansa             { sansa++; }
Robert            { robert++; }
Joffrey           { joffrey++; }
Stannis           { stannis++; }
Aegon             { aegon++; }
Daenerys          { daenerys++; }
[Aa]erys             { aerys++; }
Tywin             { tywin++; }
Jaime             { jaime++; }
Tyrion            { tyrion++; }
Cersei            { cersei++; }


%%

int main(int argc, char *argv[]) {
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

    printf("Lugares Juego de Tronos:\n");
    printf("Total de veces que aparece Westeros: %d\n", west);
    printf("Total de veces que aparece Invernalia: %d\n", inver);
    printf("Total de veces que aparece Desembarco del Rey: %d\n", desem_rey);
    printf("Total de veces que aparece Nido de Águilas: %d\n", nido_agui);
    printf("Total de veces que aparece Altojardín: %d\n", alto);
    printf("Total de veces que aparece Aguasdulces: %d\n", aguas);
    printf("Total de veces que aparece Rocadragón: %d\n", roca_dra);
    printf("Total de veces que aparece Roca Casterly: %d\n", roca_cas);
    printf("Total de veces que aparece Bastión de Tormentas: %d\n", bast);
    printf("Total de veces que aparece Dorne: %d\n", dorne);
    printf("Casas principales:\n");
    printf("Total de veces que aparece Stark: %d\n", stark);
    printf("Total de veces que aparece Arryn: %d\n", arryn);
    printf("Total de veces que aparece Tully: %d\n", tully);
    printf("Total de veces que aparece Greyjoy: %d\n", greyjoy);
    printf("Total de veces que aparece Lannister: %d\n", lannister);
    printf("Total de veces que aparece Tyrell: %d\n", tyrell);
    printf("Total de veces que aparece Martell: %d\n", martell);
    printf("Total de veces que aparece Baratheon: %d\n", baratheon);
    printf("Total de veces que aparece Targaryen: %d\n", targaryen);
    printf("Personajes principales:\n");
    printf("Total de veces que aparece Eddard: %d\n", eddard);
    printf("Total de veces que aparece Catelyn: %d\n", catelyn);
    printf("Total de veces que aparece Arya: %d\n", arya);
    printf("Total de veces que aparece Sansa: %d\n", sansa);
    printf("Total de veces que aparece Robert: %d\n", robert);
    printf("Total de veces que aparece Joffrey: %d\n", joffrey);
    printf("Total de veces que aparece Stannis: %d\n", stannis);
    printf("Total de veces que aparece Aegon: %d\n", aegon);
    printf("Total de veces que aparece Daenerys: %d\n", daenerys);
    printf("Total de veces que aparece Aerys: %d\n", aerys);
    printf("Total de veces que aparece Tywin: %d\n", tywin);
    printf("Total de veces que aparece Jaime: %d\n", jaime);
    printf("Total de veces que aparece Tyrion: %d\n", tyrion);
    printf("Total de veces que aparece Cersei: %d\n", cersei);

    fclose(file);
    return 0;
}
