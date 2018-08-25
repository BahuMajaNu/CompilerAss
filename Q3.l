%{
#include <stdio.h>
#include <string.h>
#define ECHO fwrite(yytext, yyleng, 1, yyout)
int p=0;
void fun(char *str,int len);

%}

%%
for\([^\n]*\;[^\n]*\;[^\n]*\)[ \t\n]*\{[^\0]*\} { fun(yytext,yyleng);}
for\([^\n]*\;[^\n]*\;[^\n]*\)[ \t\n]*[^\;]\; { fun(yytext,yyleng);}
.|\n ECHO ;
%%



void fun(char *str,int len){
	int i=0;
	for(;i<len && str[i]!='(';i++);
	i++;



	/*Assignment operation before loop starts*/
	char c[len];
	int j=0;	
	for(;i<len && str[i]!=';';i++){
		c[j++]=str[i];
	}
	c[j]='\0';
	fprintf(yyout,c);
	fprintf(yyout,";\n");	
	i++;
			
			
			
	// Conditional statments 
	fprintf(yyout,"while(");
	j=0;	
	for(;i<len && str[i]!=';';i++){
		c[j++]=str[i];
	}
	c[j]='\0';
	fprintf(yyout,c);
	i++;
	fprintf(yyout,")\n");
	


	// Saving change in looping variable statments in a string
	j=0;	
	for(;i<len && str[i]!=')';i++){
		c[j++]=str[i];
	}
	c[j]='\0';
	i++;
	



	// Statments inside loop
	char b[len];
	int k=0;
	for(;i<len-1;i++){
		b[k++]=str[i];
	}
	b[k]='\0';
	fprintf(yyout,b);
	
	
	
	// Change in looping variables
	fprintf(yyout,c);
	fprintf(yyout,";\n}\n");
}



main(int argc, char *argv[])
{
	/*
		To run enter the file-names source and target as command line input.
	*/
	yyin = fopen(argv[1], "r");
	yyout=fopen(argv[2],"w");
        yylex();
}
