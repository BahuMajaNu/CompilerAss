%{
#include <stdio.h>
int p=0;
%}
%%
[a-zA-Z0-9]*[aAeEiIoOuU][a-zA-Z0-9]*[aAeEiIoOuU][a-zA-Z0-9]* { printf("%s\n", yytext); p++;}
.	;
\n     { return;}
%%

main()
{
        yylex();
       	printf("Number of strings with at least 2 vowels : %d\n",p);	
}
