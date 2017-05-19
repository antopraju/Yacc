%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token NUM LET NL

%%
S : LET A NL { printf("This is a valid Identifier\n"); exit(0); }
A : LET A
  | NUM A
  | LET
  | NUM
  |
  ;
%%

int yyerror(char *s){
	printf("This is not a valid expression\n");
	exit(0);
}

int main(){
	printf("Enter the variable\n");
	yyparse();
	return 0;
}
