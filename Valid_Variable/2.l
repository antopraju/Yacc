%{
/* This code is written by Anthony Prajwal P
 * Develop a yacc program to recognize a valid variable, which starts with a letter, followed by any number of letter of digits.
 */
%}

%{
#include "y.tab.c"
%}

%%
[0-9]+		return NUM;
[a-zA-Z_]	return LET;
\n		return NL;
.		return yytext[0];
%%

int yywrap(){
	return 1;
}
