//This is only to validate array with array index
//3address code generator is 3addd.y
%{
#include<stdio.h>
int count=0;
int b=4; //size of 2nd
%}
%start mystartsymbol
%union{
	char c;

}
%token  ASS
%token<c> VAR
%token<c> OP OPEN CLO


%%

mystartsymbol : expr { printf("the expression\n");}
;

expr : VAR ASS stmt
	|VAR dim ASS stmt
;

stmt : VAR OP stmt
	| VAR
	| VAR dim OP stmt
	| VAR dim 
;

dim : OPEN VAR CLO dim 
	| OPEN stmt CLO dim 
	| 
;

%%
/* start of programs */
#include <stdio.h>
#include "lex.yy.c"

main()
{
 return  yyparse();
}

yyerror(char *s){
	fprintf(stderr,"%s\n",s);
}

