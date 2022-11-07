%token NUM

%%
line    :   expr '\n'
        ;

expr    :   expr '+' term
        |   expr '-' term
        |   term
        ;

term    :   term '*' factor
        |   term '/' factor
        |   factor
        ;

factor  :   '(' expr ')'
        |   NUM
        ;
%%

#include <ctype.h>

yylex()
{
    int c;

    while( (c = getchar()) == ' ');

    if(isdigit(c)){
        yylval = c - '0';
        while( isdigit(c = getchar()))
            yylval = yylval*10 +(c - '0');
        ungetc(c , stdin);
        return NUM;}
    else 
        return c;
}

