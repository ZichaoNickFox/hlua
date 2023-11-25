cd data

################################ alex with debugging
# alex -d Lexer.x
################################ alex without debugging
alex Lexer.x
if [[ $? -ne 0 ]]; then
  echo "alex Lexer.x error"
  exit 1
fi
mv Lexer.hs ../src

################################ happy with debugging
happy -d -a -i Parser.y
################################ happy without debugging
# happy Parser.y
if [[ $? -ne 0 ]]; then
  echo "happy Parser.y error"
  exit 1
fi
mv Parser.hs ../src

cd ..

# stack run
# stack run -- -f ./res/Script/Logic/BP_XHUD_C.lua
# stack run -- -d ./res/Script
stack run -- -f ./res/Script/UI/UIConstant.lua