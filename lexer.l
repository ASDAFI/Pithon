%{
#include <stdio.h>
#include "parser.tab.h"
%}

%%
"def"               { return DEF; }
"for"               { return FOR; }
"while"             { return WHILE; }
"if"                { return IF; }
"else"              { return ELSE; }
"and"               { return AND; }
"or"                { return OR; }
"not"               { return NOT; }
"True"              { return TRUE; }
"False"             { return FALSE; }
"None"              { return NONE; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
":"                 { return COLON; }
"="                 { return ASSIGN; }
";"                 { return SEMICOLON; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
"==|!=|<|>|<=|>="   { return REL_OP; }
"in"                {return IN;}
[ \t]+              { /* ignore whitespace */ }
\n                  { /* ignore newline */ }
.                   { /* unrecognized token */ }

%%

int yywrap() {
    return 1;
}
int main() {
    printf("Enter string: ");
    yylex();

    return 0;
}