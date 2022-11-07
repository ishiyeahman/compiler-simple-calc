/* needed to avoid error, it will not confict with the main code*/
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
int getchar(void);
%}


%%

input   :   expr '\n' {printf("correct expression\n"); };

expr    :   expr  '+' term {printf("expr + term -> expr\n"); }
        |   expr '-' term {printf("expr - term -> expr\n"); }
        |   term {printf("term -> expr\n"); }
        ;
term    :   term '*' factor {printf("term * factor -> term\n"); }
        |   term '/' factor {printf("term / factor -> term\n"); }
        |   factor  {printf("factor -> term \n"); }
        ;


factor  :   'i'     {printf("i -> factor\n");}
        | '(' expr ')' {printf("( expr ) -> factor \n"); }
        ;

%%



int yylex(){
    int c;

    switch(c = getchar()){
        case EOF:printf("EOF detected");break;
        case '\n':printf("--> '\\n'\n");break;
        default: printf("--> '%c'\n", c);break;
    }

    return c;
}

