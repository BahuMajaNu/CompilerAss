%{
#include <stdio.h>
int p=0;
%}
%%
[a-zA-Z0-9]*[pP][a-zA-Z0-9]*[tT][a-zA-Z0-9]* { printf("%s\n", yytext); p++;}
[a-zA-Z0-9]*[tT][a-zA-Z0-9]*[pP][a-zA-Z0-9]* { printf("%s\n", yytext); p++;}
.	;
\n     { return;}
%%

main()
{
        yylex();
       	printf("Number of strings with 'p' or 't' : %d\n",p);	
}
