%{
#include <stdio.h>
int p=0;
%}
%%
[aAeEiIoOuU] { p++;}
.	;
\n     { return;}
%%

main()
{
        yylex();
       	printf("Number of vowels : %d\n",p);	
}
