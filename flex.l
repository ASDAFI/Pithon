%{
#include <stdio.h>
%}

%option noyywrap

%%
"if"            { printf("IF\n"); }
"else"          { printf("ELSE\n"); }
"while"         { printf("WHILE\n"); }
"for"           { printf("FOR\n"); }
"int"           { printf("INT\n"); }
\"[^"]*\"       { printf("STRING: %s\n", yytext); }
'[^']*'         { printf("STRING: %s\n", yytext); }
"("             { printf("LPAR\n"); }
")"             { printf("RPAR\n"); }




">="            { printf("GREATER OR EQUAL\n"); }
"<="            { printf("LESS OR EQUAL\n"); }
">"             { printf("GREATER THAN\n"); }
"<"             { printf("LESS THAN\n"); }

[0-9]+          { printf("INTEGER: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }

"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULTIPLY\n"); }
"/"             { printf("DIVIDE\n"); }
"="             { printf("ASSIGN\n"); }
"=="            { printf("EQUAL\n"); }

":"             { printf("COLUMN\n");}
[ \t\n]         { /* Ignore whitespace and newlines */ }

.               { printf("UNRECOGNIZED: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
