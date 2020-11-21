/*
 * exprL-pre-s3.y : A simple yacc expression parser
 *          Based on the Bison manual example. 
 * You need add rules with actions to complete the conversion 
 * from infix expression to corresponding Polish expression.
 */

%{
#include <stdio.h>
#include <math.h>
int yylex();
void yyerror(const char *s);
int lineno = 0;
%}

%union {
   float val;
   char *op;
}

%token <val> NUMBER
%token <op> PLUS MINUS MULT DIV EXPON
%token EOL
%token LB RB

%left  MINUS PLUS
%left  MULT DIV
%right EXPON
%right UMINUS

%type  <val> exp

%%
input   :
	  { lineno ++; 
	  }
        |  
          input
	  { 
	    printf("Line %d:\n\t", lineno++);
	  }
          line
        ;

line    : EOL			{ printf("\n");}
        | exp EOL 		{ printf("\t%g\n",$1);}

exp     : /* add your rules with actions */
        ;

%%

void yyerror(const char *message)
{
  printf("%s\n",message);
}

int main(int argc, char *argv[])
{
  yyparse();
  return(0);
}

