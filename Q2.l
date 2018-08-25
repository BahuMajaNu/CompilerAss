%{
#include <stdio.h>
#define ECHO fwrite(yytext, yyleng, 1, yyout)
int p=0;
void printToCout(char * str,int len);
void scanToCin(char * str,int len);

%}
%%
printf[ \t]*\([^(\|\n))]*\)[ \t]*\; { printToCout(yytext,yyleng); }
scanf[ \t]*\([^(\|\n))]*\)[ \t]*\; { scanToCin(yytext,yyleng); }
.|\n ECHO ;
%%


void printToCout(char * str,int len){
	fprintf(yyout,"cout");
	int i=0;
	for(;i<len && str[i]!='\"';i++)	;
	i++;
	//printf("%d\n",i);
	int e=len-1;
	for(;e>i && str[e]!='\"';e--)	;
	e++;
	e++;
	char c[2*len];
	int j=0;
	
	// Reaching nearest % symbol chaning it to "<< variable name <<"
	for(;i<len && str[i]!='"';i++){
		c[j++]='<';
		c[j++]='<';
		c[j++]='\"';
		for(;i<len && str[i]!='%' && str[i]!='\"';i++){
			c[j++]=str[i];
		}
		c[j++]='\"';
		//printf("%c",str[i+1]);
		if(str[i]=='%'){
			c[j++]='<';
			c[j++]='<';
			i++;
			//printf("%d ",e);
			for(;e<len && str[e]==' ' && str[e]!=')';e++);
			//printf("%d ",e);
			for(;e<len && str[e]!=')' && str[e]!=',';e++){
				printf("%d%c ",e,str[e]);
				c[j++]=str[e];
			}	
			//printf("%d\n",e);
			e++;
		}
		else 
			break;
	}
	c[j++]=';';
	c[j]='\0';
	fprintf(yyout,c); 
	
}

void scanToCin(char * str,int len){
	fprintf(yyout,"cin>>");
	int i=0;
	
	for(;i<len && str[i]!=',';i++)	;
	i++;
	char c[len];
	int j=0;
	
	
	
	// Reaching to variable names, getting rid of & and adding variable with ">>"
	for(;i<len && str[i]!=')';i++){
		for(;i<len && str[i]==' ' && str[i]!=')';i++);
		for(;i<len && str[i]=='&' && str[i]!=')';i++);		
		for(;i<len && str[i]==' ' && str[i]!=')';i++);
		for(;i<len && str[i]!=')' && str[i]!=',';i++)
			c[j++]=str[i];
		if(str[i]==',')
			c[j++]='>',c[j++]='>';
	}
	c[j]='\0';
	fprintf(yyout,c);
	//fprintf(yyout,";");
}



main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	yyout=fopen(argv[2],"w");
        yylex();
}
