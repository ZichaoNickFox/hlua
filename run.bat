cd data

alex Lexer.x
IF %ERRORLEVEL% NEQ 0 EXIT
move Lexer.hs ../src

happy Parser.y
IF %ERRORLEVEL% NEQ 0 EXIT
move Parser.hs ../src

cd ..

@REM stack run -- -d D:\liuzichao_ProjectX_Dev_D\ProjectX\Content\Script 
stack run -- -f D:\liuzichao_ProjectX_Dev_D\ProjectX\Content\Script\Logic\BP_XHUD_C.lua