%{
    #include <stdio.h>
%}

%%
[1-9]+ printf("%s", yytext);
. printf(" ");

%%
int main ()
{
    yylex();
}
