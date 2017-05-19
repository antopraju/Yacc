%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token NUM ID NL
%left '+' '-'
%left '*' '/'

%%
S : E NL	{printf("This is a valid expression\n"); exit(0);}
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | ID
  | NUM
  ;
%%

int yyerror(char *s){
	printf("This is not a valid expression\n");
	exit(0);
}

int main(){
	printf("Enter the expression:\n");
	yyparse();
	return 0;
}
