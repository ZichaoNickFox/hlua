{
module Grammar where
import Tokens
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
    let { TokenLet }
    in  { TokenIn }
    int { TokenInt $$ }
    var { TokenSym $$ }
    '=' { TokenEq }
    '+' { TokenPlus }
    '-' { TokenMinus }
    '*' { TokenTimes }
    '/' { TokenDiv }
    '(' { TokenLParen }
    ')' { TokenRParen }

%right in
%nonassoc '>' '<'
%left '+' '-'
%left '*' '/'
%left NEG

%%

Exp : let var '=' Exp in Exp { Let $2 $4 $6 }
    | '-' Exp %prec NEG      { Negate $2 }
    | Exp Binop Exp          { Binop $1 $3 }
    -- | Exp '+' Exp { Plus }
    -- | Exp '-' Exp { Minus }
    -- | Exp '*' Exp { Times }
    -- | Exp '/' Exp { Div }
    | '(' Exp ')'            { Parentheses $1 $2 }
    | int                    { Int $1 }
    | var                    { Var $1 }

Binop : '+' { Plus }
      | '-' { Minus }
      | '*' { Times }
      | '/' { Div }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp = Let String Exp Exp
         | Plus Exp Exp
         | Minus Exp Exp
         | Times Exp Exp
         | Div Exp Exp
         | Negate Exp
         | Brack Exp
         | Int Int
         | Var String
         deriving Show
}