%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
int getchar(void);
char usingChar[] = {'\n', '+', '-', '*', '/', '%', '(', ')', '0', '1','2','3','4', '5', '6','7','8','9'};
int arraySize =  sizeof(usingChar) / sizeof(char);
int isUsedChar(int);
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
        ;
%%

#include <ctype.h>

int yylex()
{
        int c;

        while(1){
            c = getchar();
            if( c  != ' ' && c  != '\t'){
                if(isUsedChar(c))
                        break;
                
                printf("'%c' is prohibited.\n", c);
            }
            
        };
        return c;
}

int isUsedChar(int c){
        for(int i = 0; i < arraySize - 1; i++){
                if( c == (char)usingChar[i])
                        return 1;
        }

        return 0;
}

