%{ 
	#include <stdlib.h>
	#include "ex02.tab.h" 
%} 

%option noyywrap 

%% 

[-+]?[0-9]+              { yylval = atoi(yytext); return INT; }
\n|<|>|=                 return yytext[0];  
"<="                     return MENOR_IGUAL;  
">="                     return MAIOR_IGUAL; 
"<>"                     return DIFERENTE; 
[ \t\r]* 
.                        printf("Erro Lexico: carácter inválido (%d)\n", yytext[0]); 
<<EOF>>                  return 0; 

%%

