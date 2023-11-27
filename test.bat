mkdir src

cd data

@REM ##############################
alex Lexer.x
@REM ##############################
@REM alex -d Lexer.x
@REM ##############################
IF %ERRORLEVEL% NEQ 0 EXIT
move Lexer.hs ../src/Lexer.hs

@REM ##############################
happy Parser.y
@REM ##############################
@REM happy -d -a -i Parser.y
@REM ##############################
@REM happy Parser.y
IF %ERRORLEVEL% NEQ 0 EXIT
move Parser.hs ../src/Parser.hs

cd ..
stack test