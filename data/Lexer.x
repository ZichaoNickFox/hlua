{
module Lexer where

import Data.Maybe (Maybe(Just, Nothing))
import BNFC.Lex (utf8Encode)
import Data.Word (Word8)
import Data.Char (chr)
import Debug.Trace (trace)
import Numeric (readHex)

}

$alpha      = [a-zA-Z]
$digit      = [0-9]
$hexdigit   = [0-9A-Fa-f]

@identifier = [a-zA-Z_][a-zA-Z0-9_]*

@string1    = \"([^\"\\]|(\\.))*\"
@string2    = \'([^\'\\]|(\\.))*\'
-- FIXME : Not support '[' and ']' in long string
@string3    = \[\[[^\[\]]*\]\]

@integer1   = "0x" $hexdigit+
@integer2   = $digit+

@float1     = $digit+ \. $digit+ ([eE] [\+\-]? $digit+)?
@float2     = $digit+ [eE] [\+\-]? $digit+

tokens :-
  -- whitespace
  $white+             ;

  -- comment
  "--"[^\n]*          ;
  -- "--"\[\[(.|\n)*\]\] ;

  -- keyword
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  -- and       break     do        else      elseif    end
  -- false     for       function  goto      if        in
  -- local     nil       not       or        repeat    return
  -- then      true      until     while
  "and"           { \_ -> TokenAnd }
  "break"         { \_ -> TokenBreak }
  "do"            { \_ -> TokenDo }
  "else"          { \_ -> TokenElse }
  "elseif"        { \_ -> TokenElseif }
  "end"           { \_ -> TokenEnd }

  "false"         { \_ -> TokenFalse }
  "for"           { \_ -> TokenFor }
  "function"      { \_ -> TokenFunction }
  "goto"          { \_ -> TokenGoto }
  "if"            { \_ -> TokenIf }
  "in"            { \_ -> TokenIn }

  "local"         { \_ -> TokenLocal }
  "nil"           { \_ -> TokenNil }
  "not"           { \_ -> TokenNot }
  "or"            { \_ -> TokenOr }
  "repeat"        { \_ -> TokenRepeat }
  "return"        { \_ -> TokenReturn }

  "then"          { \_ -> TokenThen }
  "true"          { \_ -> TokenTrue }
  "until"         { \_ -> TokenUntil }
  "while"         { \_ -> TokenWhile }

  -- https://www.lua.org/manual/5.4/manual.html#3.1
  -- Other tokens
  -- +     -     *     /     %     ^     #
  -- &     ~     |     <<    >>    //
  -- ==    ~=    <=    >=    <     >     =
  -- (     )     {     }     [     ]     ::
  -- ;     :     ,     .     ..    ...
  "+"             { \_ -> TokenAdd }
  "-"             { \_ -> TokenMinus }
  "*"             { \_ -> TokenMutiply }
  "/"             { \_ -> TokenDevide }
  "%"             { \_ -> TokenModulus }
  "^"             { \_ -> TokenPower }
  "#"             { \_ -> TokenLength }

  "&"             { \_ -> TokenBitwiseAnd }
  "~"             { \_ -> TokenBitwiseNot }
  "|"             { \_ -> TokenBitwiseOr }
  "<<"            { \_ -> TokenLeftShift }
  ">>"            { \_ -> TokenRightShift }
  "//"            { \_ -> TokenFloorDivision }

  "=="            { \_ -> TokenEquals }
  "~="            { \_ -> TokenNotEquals }
  "<="            { \_ -> TokenLessThanEquals }
  ">="            { \_ -> TokenGreaterThanEquals }
  "<"             { \_ -> TokenLessThan }
  ">"             { \_ -> TokenGreaterThan }
  "="             { \_ -> TokenAssign }

  "("             { \_ -> TokenLeftParentheses }
  ")"             { \_ -> TokenRightParentheses }
  "{"             { \_ -> TokenLeftBrace }
  "}"             { \_ -> TokenRightBrace }
  "["             { \_ -> TokenLeftBracket }
  "]"             { \_ -> TokenRightBracket }
  "::"            { \_ -> TokenDoubleColon }

  ";"             { \_ -> TokenSemicolon }
  ":"             { \_ -> TokenColon }
  ","             { \_ -> TokenComma }
  "."             { \_ -> TokenDot }
  ".."            { \_ -> TokenConcat }
  "..."           { \_ -> TokenVararg }

  -- integer
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  @integer1       { \s -> TokenInteger (fst $ head $ readHex s) }
  @integer2       { \s -> TokenInteger (read s) }

  -- float
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  @float1         { \str -> TokenFloat (read str :: Float) }
  @float2         { \str -> TokenFloat (read str :: Float) }

  -- identifier
  @identifier     { \str -> TokenIdentifier str }

  -- string
  @string1        { \str -> TokenString (read str :: String) }
  @string2        { \str -> TokenString (read $ convertLuaSQ2DQ str :: String) }
  @string3        { \str -> TokenString $ (drop 2 . init. init) str }

{
data Token = 
  -- keyword
    TokenAnd
  | TokenBreak
  | TokenDo
  | TokenElse
  | TokenElseif
  | TokenEnd

  | TokenFalse
  | TokenFor
  | TokenFunction
  | TokenGoto
  | TokenIf
  | TokenIn

  | TokenLocal
  | TokenNil
  | TokenNot
  | TokenOr
  | TokenRepeat
  | TokenReturn

  | TokenThen
  | TokenTrue
  | TokenUntil
  | TokenWhile

  -- Other tokens
  | TokenAdd
  | TokenMinus
  | TokenMutiply
  | TokenDevide
  | TokenModulus
  | TokenPower
  | TokenLength

  | TokenBitwiseAnd
  | TokenBitwiseNot
  | TokenBitwiseOr
  | TokenLeftShift
  | TokenRightShift
  | TokenFloorDivision

  | TokenEquals
  | TokenNotEquals
  | TokenLessThanEquals
  | TokenGreaterThanEquals
  | TokenLessThan
  | TokenGreaterThan
  | TokenAssign

  | TokenLeftParentheses
  | TokenRightParentheses
  | TokenLeftBrace
  | TokenRightBrace
  | TokenLeftBracket
  | TokenRightBracket
  | TokenDoubleColon

  | TokenSemicolon
  | TokenColon
  | TokenComma
  | TokenDot
  | TokenConcat
  | TokenVararg

  -- integer
  | TokenInteger Integer

  -- float
  | TokenFloat Float

  -- identifier
  | TokenIdentifier String
  | TokenString String

  deriving (Eq, Show)

type Byte = Word8

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

-- 1. replace single " into \"
-- 2. replace head/last ' into \"
convertLuaSQ2DQ :: String -> String
convertLuaSQ2DQ s = let mid = (init . tail) s
                        replaceFunc :: (String, Bool) -> Char -> (String, Bool)
                        replaceFunc = \(acc, begunBackslash) c -> case c of
                                                                    '\"' -> if begunBackslash
                                                                            then (c : acc, False)
                                                                            -- foldl and reverse whose string in the end
                                                                            else (c : '\\' : acc, False)
                                                                    '\\' -> (c : acc, not begunBackslash)
                                                                    o    -> (o : acc, False)
                        replace1 = reverse $ fst $ foldl replaceFunc ([], False) mid
                        replace2 = '\"' : replace1 ++ "\""
                    in  replace2
}