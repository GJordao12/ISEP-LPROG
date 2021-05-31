
%{
	#include <stdio.h>
	int qtdNumeros=0, nLinhas=0;
%}

CADEIA ola

%%
   /* Se a ação for descrita numa só linha as chavetas podem ser omitidas */

\n	nLinhas++;
{CADEIA}+ qtdNumeros++;
.

%%
int main ()
{
	yylex();
	printf("Linhas=%d\n",nLinhas);
	printf("Numero de sequencias=%d\n",qtdNumeros);
}

