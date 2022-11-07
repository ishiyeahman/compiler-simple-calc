/* needed to avoid error, it will not confict with the main code*/
%{
int yylex(void);
void yyerror(const char *s);
int getchar(void);
%}


%%

input   :   expr '\n';
expr    :   expr  '+' term | expr '-' term | term;
term    :   term '*' factor | term '/' factor | factor;
factor  :   'i' | '(' expr ')';

%%



int yylex(){
    return getchar();
}

