%{
    #include <stdio.h>
    int countAlg = 0;
    int countLetra = 0;
    int countLinhas = 0;
    int countT = 0;
    int countCaracNaoIdent = 0;
    int countOutro = 0;
%}

NUMS [0-9]
LETRAS [A-Za-z]
ESPACO [ ]
%%	
{NUMS} {countAlg++;}
{LETRAS} {countLetra++;}
{ESPACO} {countT++;}
\t {countT++;}
\n {countLinhas++;}
.	{countOutro++;}

%%	
main()
{
	yylex();
    printf("Número de algarismo: %d\n", countAlg);
    printf("Número de letras: %d\n", countLetra);
    printf("Número de Tabulações %d\n", countT);
    printf("Número de Linhas %d\n", countLinhas);
    printf("Número de outros caracteres %d\n", countOutro);
	printf("\nFIM\n");
}
