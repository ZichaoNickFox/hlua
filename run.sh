cd res
alex Lexer.x
if [[ $? -ne 0 ]]; then
  echo "alex Lexer.x error"
  exit 1
fi
mv Lexer.hs ../src
cd ..
stack run