cd res
alex Lexer.x
if [[ $? -ne 0 ]]; then
  echo "alex Lexer.x error"
  exit 1
fi
mv Lexer.hs ../src
cd ..
stack run
# stack run -- -f D:\liuzichao_ProjectX_Dev_D\ProjectX\Content\Script\Logic\BP_XHUD_C.lua