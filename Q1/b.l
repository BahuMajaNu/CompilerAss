%{
#include <stdio.h>
%}
%%
[ \t\n][aAeEiIoOuU][a-zA-Z0-9]* { printf("%s\n", yytext); }
.	;
\n     { return;}
%%
main()
{
        yylex();
}
