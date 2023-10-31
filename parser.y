%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror(const char* msg);

int indent_level = 0;

void increase_indent() {
    indent_level++;
}

void decrease_indent() {
    indent_level--;
}

void syntax_error(const char* expected, const char* found) {
    fprintf(stderr, "Syntax error: Expected %s, found %s\n", expected, found);
    exit(1);
}

%}

%token DEF FOR WHILE IF ELSE AND OR NOT TRUE FALSE NONE
%token LPAREN RPAREN COLON ASSIGN SEMICOLON LBRACE RBRACE REL_OP COMMA
%token IN
%token INDENT DEDENT NEWLINE
%token NAME
%token NUMBER

%%

program:
    statement
    | program statement
    ;

statement:
    simple_stmt
    | compound_stmt
    | error { syntax_error("valid statement", $1); }
    ;

simple_stmt:
    expression SEMICOLON
    | NEWLINE
    ;

compound_stmt:
    def_stmt
    | if_stmt
    | while_stmt
    | for_stmt
    ;

def_stmt:
    DEF NAME parameters COLON INDENT statement DEDENT
    ;

parameters:
    LPAREN RPAREN
    | LPAREN param_list RPAREN
    ;

param_list:
    NAME
    | param_list COMMA NAME
    ;

if_stmt:
    IF expression COLON INDENT statement DEDENT
    | IF expression COLON INDENT statement DEDENT ELSE COLON INDENT statement DEDENT
    ;

while_stmt:
    WHILE expression COLON INDENT statement DEDENT
    ;

for_stmt:
    FOR NAME IN expression COLON INDENT statement DEDENT
    | error { syntax_error("FOR statement", $1); }
    ;

expression:
    NAME
    | NUMBER
    | expression REL_OP expression
    | LPAREN expression RPAREN
    | expression AND expression
    | expression OR expression
    | NOT expression
    | TRUE
    | FALSE
    | NONE
    ;

%%

void yyerror(const char* msg) {
    fprintf(stderr, "Error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}
