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
5 :;@@ +2
':' is prohibited.
';' is prohibited.
'@' is prohibited.
'@' is prohibited.
ans >> 7
8 / 0
division by zero
ans >> 0
3 - 2
ans >> 1
3 + -2
ans >> 1
(1+3)/2 - (8-7)/1
ans >> 1
6               % 5
ans >> 1
q
```