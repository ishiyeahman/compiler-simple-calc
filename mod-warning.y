%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
int getchar(void);
%}

%start line

%%
line    :   expr '\n'   { printf("%d\n", $1); }
;

expr    :   expr '+' term       { $$ = $1 + $3; }
        |   expr '-' term       { $$ = $1 - $3; }
        |   term                { $$ = $1; }
        ;

term    :   term '*' factor     { $$ = $1 * $3; } /*擬似変数*/
        |   term '/' factor     { $$ = $1 / $3; }
        |   term '%' factor     { $$ = $1 % $3; } /* add mode (improve 1)*/
        |   factor              { $$ = $1; }
        ;

factor  :   '(' expr ')'        {$$ = $2;}
        |   '0'                 {$$ = 0; }
        |   '1'                 {$$ = 1; }
        |   '2'                 {$$ = 2; }
        |   '3'                 {$$ = 3; }
        |   '4'                 {$$ = 4; }
        |   '5'                 {$$ = 5; }
        |   '6'                 {$$ = 6; }
        |   '7'                 {$$ = 7; }
        |   '8'                 {$$ = 8; }
        |   '9'                 {$$ = 9; }
        /* |                       {printf("There is a unavailble character!"); } */
        ;
%%

#include <ctype.h>

int yylex()
{
        int c;

        while(1){
            c = getchar();
            if( c  != ' ' && c  != '\t')
                break;
        };
        return c;
}

