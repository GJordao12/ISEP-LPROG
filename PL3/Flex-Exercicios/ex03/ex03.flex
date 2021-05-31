%{
    #include <stdio.h>
%}

NUMS [0-9]{2}
LETRAS [A-Z]{2}
MATR ({NUMS}-{NUMS}-{LETRAS})|({NUMS}-{LETRAS}-{NUMS})|({LETRAS}-{NUMS}-{NUMS})

%%

{MATR} {printf("%s é uma matrícula portuguesa!",yytext);}
.* {printf("%s é uma matrícula inválida!\n", yytext);}
\n 

%%

int main(){
	yylex();
	return 0;
	
}
