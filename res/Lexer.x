{
module Lexer where

type AlexInput =
  ( Char      -- previous char
  , [Byte]    -- rest of the bytes for the current char
  , String    -- rest of the input string
  )

alexGetByte :: AlexInput -> Maybe (Byte, AlexInput)
alexGetByte (c, b:bs, s  ) = Just (b, (c, bs, s))
alexGetByte (c, []  , [] ) = Nothing
alexGetByte (_, []  , c:s) = case utf8Encode c of
                               b:bs -> Just (b, (c, bs, s))

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (c, _, _) = c

-- alexScanTokens :: String -> [token]
alexScanTokens str = go ('\n', [], str)
  where
    go inp@(_,_bs,str) =
      case alexScan inp 0 of
        AlexEOF                -> []
        AlexSkip  inp' len     -> go inp'
        AlexToken inp' len act -> act (take len str) : go inp'
        AlexError _            -> error "lexical error"

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
