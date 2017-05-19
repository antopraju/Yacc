%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token A B NL

%%
E : C D NL {printf("This is valid expression\n"); exit(0);}
C : A C
  | A
  | 
  ;
D : B D
  | B
  | 
  ;
%%

int yyerror(char *s){
	printf("This is not a vaid expression\n");
	exit(0);
}

int main(){
	printf("Enter the expression:\n");
	yyparse();
	return 0;
}
