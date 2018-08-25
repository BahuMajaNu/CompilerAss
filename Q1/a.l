%{
#include <stdio.h>
%}
%%
[ \t\n][kK][a-zA-Z0-9]* { printf("%s\n", yytext); }
.	;
\n     { return;}
%%
main()
{
        yylex();
}
