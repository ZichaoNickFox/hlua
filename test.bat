cd res
alex Lexer.x
IF %ERRORLEVEL% NEQ 0 EXIT
move Lexer.hs ../src
cd ..
stack test