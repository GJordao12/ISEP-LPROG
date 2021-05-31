%{
    #include <stdio.h>
%}

ALGARISMO [0-9]+
INTEIRO (-?{ALGARISMO})
REAIS (-?{ALGARISMO}.{ALGARISMO}|-?{ALGARISMO},{ALGARISMO})
%%
{INTEIRO} {printf("Não tem parte decimal bro.\n");}                   
{REAIS}  {printf("Este tem bro.\n");}
.*  {printf("Erro\n");}

%%
int main ()
{
    yylex();
}
