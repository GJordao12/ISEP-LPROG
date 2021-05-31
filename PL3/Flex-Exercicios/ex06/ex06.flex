%{
    #include <stdio.h>
%}

ALGARISMO [0-9]+
INTEIRO (-?{ALGARISMO})
REAIS (-?{ALGARISMO}.{ALGARISMO}|-?{ALGARISMO},{ALGARISMO})
%%
{INTEIRO} {printf("É número inteiro.\n");}                   
{REAIS}  {printf("É número real.\n");}
.*  {printf("Erro\n");}

%%
int main ()
{
    yylex();
}
