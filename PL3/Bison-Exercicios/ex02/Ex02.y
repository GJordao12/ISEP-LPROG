
%{ 
  #include <stdio.h>
  
  int yylex();
  int yyerror(char *s);
  
  int numErrors=0;
%} 

%token INT MENOR_IGUAL MAIOR_IGUAL DIFERENTE 

%% 

inicio: /* vazio */
	| inicio comparacao '\n'
	| inicio '\n'
	| inicio error '\n'
	;

comparacao: INT '<' INT         { if ($1<$3)  printf("%d < %d - Verdadeiro\n",$1,$3); else printf("%d < %d - Falso\n",$1,$3); }
	|   INT '>' INT		{ if ($1>$3)  printf("%d > %d - Verdadeiro\n",$1,$3); else printf("%d > %d - Falso\n",$1,$3); }
	|   INT '=' INT		{ if ($1==$3) printf("%d = %d - Verdadeiro\n",$1,$3); else printf("%d = %d - Falso\n",$1,$3); }
	|   INT MENOR_IGUAL INT { if ($1<=$3) printf("%d <= %d - Verdadeiro\n",$1,$3); else printf("%d <= %d - Falso\n",$1,$3); } 
	|   INT MAIOR_IGUAL INT { if ($1>=$3) printf("%d >= %d - Verdadeiro\n",$1,$3); else printf("%d >= %d - Falso\n",$1,$3); }
	|   INT DIFERENTE INT   { if ($1!=$3) printf("%d != %d - Verdadeiro\n",$1,$3); else printf("%d != %d - Falso\n",$1,$3); }
	;	

%%

int main() 
{ 
	yyparse(); 
} 

int yyerror(char *s) 
{ 
	numErrors++; 
	printf("erro sintatico/semantico : %s\n", s); 
}	 
