%{
 #include <stdlib.h>
 #include "struct.h"
 #include "ex03.tab.h" //header gerado pelo BISON
%}

%option noyywrap 

%% 

[-+]?[0-9]+              {yylval.val.valor = atoi(yytext); yylval.val.t = INTEIRO; return TK_INT; }
[a-zA-Z]                 {yylval.val.valor = yytext[0]; yylval.val.t = CHAR;  return TK_CHAR; }
\n|<|>|=                 return yytext[0]; 
"<="                     return MENOR_IGUAL;  
">="                     return MAIOR_IGUAL; 
"<>"                     return DIFERENTE; 
[ \t\r]* 
.                        printf("Erro Lexico: carácter inválido (%d)\n", yytext[0]); 
<<EOF>>                  return 0; 

%%