cd data

alex Lexer.x
if [[ $? -ne 0 ]]; then
  echo "alex Lexer.x error"
  exit 1
fi
mv Lexer.hs ../src

happy Parser.y
if [[ $? -ne 0 ]]; then
  echo "happy Parser.y error"
  exit 1
fi
mv Parser.hs ../src

cd ..

# stack run
stack run -- -f ./res/Script/Logic/BP_XHUD_C.lua