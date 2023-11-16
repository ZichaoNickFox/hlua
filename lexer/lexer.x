{
  module Main (main) where
}

$digit      = [0 - 9]
$alpha      = [a-zA-Z]
@identifier = [a-zA-Z_][a-zA-Z0-9_]*

tokens :-
  -- whitespace
  $white+               ;

  -- comment
  "--" [^\n]*           ;

  -- keyword
  "function"    { \_ -> TokenFunction }
  "end"         { \_ -> TokenEnd }
  "if"          { \_ -> TokenIf }
  "and"         { \_ -> TokenAnd }
  "break"       { \_ -> TokenBreak }
  "do"          { \_ -> TokenDo }
  "else"        { \_ -> TokenElse }
  "elseif"      { \_ -> TokenElseif }
  "for"         { \_ -> TokenFor }
  "goto"        { \_ -> TokenGoto }
  "if"          { \_ -> TokenIf }
  "in"          { \_ -> TokenIn }
  "local"       { \_ -> TokenLocal }
  "nil"         { \_ -> TokenNil }
  "not"         { \_ -> TokenNot }
  "or"          { \_ -> TokenOr }
  "repeat"      { \_ -> TokenRepeat }
  "return"      { \_ -> TokenReturn }
  "then"        { \_ -> TokenThen }
  "true"        { \_ -> TokenTrue }
  "false"       { \_ -> TokenFalse }
  "until"       { \_ -> TokenUntil }
  "while"       { \_ -> TokenWhile }

  -- identifier
  @identifier   { \_ -> TokenVariable }
  "["           { \_ -> TokenBracketOpen }
  "]"           { \_ -> TokenBracketClose }
  "."           { \_ -> TokenDot }
