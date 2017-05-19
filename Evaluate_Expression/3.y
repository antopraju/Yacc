%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token NUM NL
%left '+' '-'
%left '*' '/'

%%
S : E NL 	{printf("The value of the expression is: %d\n",$1); exit(0);}
E : E '+' E	{$$=$1+$3;}
  | E '-' E     {$$=$1-$3;}
  | E '*' E	{$$=$1*$3;}
  | E '/' E     {if($3 == 0){
  			printf("Division by zero\n");
  			exit(0);
  		}else{
  			$$=$1/$3;
  		}
  		}
  | '(' E ')'	{$$=$2;}
  | NUM		{$$=$1;}
  ;
%%

int yyerror(char *s){
	printf("This is not a valid expression\n");
	exit(0);
}

int main(){
	printf("Enter the expression: \n");
	yyparse();
	return 0;
}	
