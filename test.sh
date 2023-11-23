cd res

alex Lexer.x
if [[ $? -ne 0 ]]; then
  echo "alex Lexer.x error"
  exit 1
fi
mv Lexer.hs ../src

happy -d -a -i Parser.x
if [[ $? -ne 0 ]]; then
  echo "happy Parser.y error"
  exit 1
fi
mv Parser.hs ../src

cd ..
stack test