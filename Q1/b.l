%{
#include <stdio.h>
%}
%%
[ \t][aAeEiIoOuU][a-zA-Z0-9]* { printf("%s\n", yytext); }
.	;
\n     { return;}
%%
main()
{
        yylex();
}
