# Yacc 演習

## Preset

以下の宣言を.yファイルの最上部に記入する必要がある．
getcharは必要に応じて入力．
`#include <stdio.h>`は`printf`

```c
/* needed to avoid error, it will not confict with the main code*/
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
int getchar(void);
%}
```

以下，terminalでのコマンド

- bison コンパイル
```shell-session
% bison -y [ファイル名.y]
```

- 実行ファイル生成
```shell-session
% gcc y.tab.c -ly -o [exeファイル名]
```

```shell-session
% ./[exeファイル名]
```

## 実行例

```linux
$ ./SimpleCalc
1 + 2
ans >> 3
1 + -2
ans >> -1
(1 + 2)*4 - (3+9)/3  
ans >> 8
4/0
division by zero
ans >> 4
9 % 2
ans >> 1
9 %             2
ans >> 1
q
```