%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
int getchar(void);
char usingChar[] = {'\n', '+', '-', '*', '/', '%', '(', ')', '0', '1','2','3','4', '5', '6','7','8','9'};
char END = 'q';
int arraySize =  sizeof(usingChar) / sizeof(char);
int isUsedChar(int);
void exit(int);

// yyperse() : 戻り値 error => 1
%}

%start line 

%%

line    :   expr '\n'   {
                        printf("ans >> %d\n", $1); 
                        if( yyparse()) exit(1); /* syntax errorならば再帰を復帰せずその処理で終了*/
                        }
        ;

expr    :   expr '+' term       { $$ = $1 + $3; }
        |   expr '-' term       { $$ = $1 - $3; }
        |   term                { $$ = $1; }
        ;

term    :   term '*' factor     { $$ = $1 * $3; } /*擬似変数*/
        |   term '/' factor     { if($3 == 0) { printf("division by zero\n"); } 
                                else { $$ = $1 / $3;} }
        |   term '%' factor     { $$ = $1 % $3; } /* add mode (improve 1)*/
        |   factor              { $$ = $1; }
        ;

factor  :   '(' expr ')'        {$$ = $2;}
        | negative_factor       {$$ = $1;}
        | positive_factor       {$$ = $1;}
        ;

negative_factor
        : '-' positive_factor   {$$ = - $2;}
        ;


positive_factor 
        :   '0'                 {$$ = 0; }
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
                
                /* プログラム終了*/
                if(c == END)
                        exit(0);

                printf("'%c' is prohibited.\n", c);
            }
            
        };
        return c;
        
}

int isUsedChar(int c){
        for(int i = 0; i < arraySize ; i++){
                if( c == (char)usingChar[i])
                        return 1;
        }

        return 0;
}


