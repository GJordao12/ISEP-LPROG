%{
    #include "Ex01.tab.h" /* header gerado pelo bison */
%}

%option case-insensitive

%%

[H][E][L][L][O] return HELLO;
[W][O][R][L][D] return WORLD;
[A-Z]+       return WORD;
[ \t\r\n]*      /**vazio*/
.               printf("Erro Lexico: caracter inválido (%d)\n",yytext[0]);
<<EOF>>         return 0 ;

%%

