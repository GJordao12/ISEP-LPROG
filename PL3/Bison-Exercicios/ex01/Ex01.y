
%{
 #include <stdio.h>
 int yyerror(char *);
 
%}

%token HELLO WORLD WORD

%start phrase

%%

phrase: 
		| phrase HELLO WORLD { printf("Hello World!!!\n"); }
		| phrase HELLO 
		| phrase WORLD 
		| phrase WORD
		;

%%

int main () {
	yyparse() ;
}

int yyerror (char *s) {
	printf("erro sintactico/semantico:%s\n",s);
}

