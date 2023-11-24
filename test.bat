cd res

alex Lexer.x
IF %ERRORLEVEL% NEQ 0 EXIT
move Lexer.hs ../src

happy -d -a -i Parser.y
@REM happy Parser.y
IF %ERRORLEVEL% NEQ 0 EXIT
move Parser.hs ../src

cd ..
stack test