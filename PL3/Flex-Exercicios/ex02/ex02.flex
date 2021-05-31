%{
    #include <stdio.h>
%}

%%
FEUP {printf("ISEP");}

2007 {printf("2008");}

%%

int main(){
	yylex();
	return 0;
	
}
