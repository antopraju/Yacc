%{
/* This code is written by Anthony Prajwal P
 * Develop a yacc program to recognize strings of the form a^m b^n, where m >= 0 and n >= 0.
 */
%}

%{
#include "y.tab.c"
%}

%%
a	return A;
b 	return B;
\n	return NL;
%%

int yywrap(){
	return 1;	
}
