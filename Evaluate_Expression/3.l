%{
/* This code is written by Anthony Prajwal P
 * Develop a yacc program to recognize a valid arthmetic expression and evaluate that expression involving operators +, -, *, /.
 */
%}

%{
#include "y.tab.c"
extern int yylval;
%}

%%
[0-9]+		{yylval = atoi(yytext); return NUM;}
\n		return NL;
. 		return yytext[0];
%%

int yywrap(){
	return 1;
}
