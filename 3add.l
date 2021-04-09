%{
#include<stdio.h>
%}

var [a-zA-Z0-9][a-zA-Z0-9]*
open "[" 
close "]"

%%

{var} { yylval.c=yytext[0];
	return (VAR);}

{open} { yylval.c=yytext[0];
	return (OPEN);}

{close} { yylval.c=yytext[0];
	return (CLO);}

"+"|"-"|"*"|"/" { yylval.c=yytext[0];
		return (OP);}

"=" {return (ASS);}

%%

