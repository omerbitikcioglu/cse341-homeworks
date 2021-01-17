gpp_interpreter: y.tab.c lex.yy.c
gcc -o gpp_interpreter gpp_interpreter.tab.c
y.tab.c: gpp_interpreter.y
bison gpp_interpreter.y
lex.yy.c: gpp_lexer.l
flex gpp_lexer.l