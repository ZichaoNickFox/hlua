{
module Parser where
import Lexer
}

%name parse
%tokentype { Token }
%error { parseError }

%token
  -- whitespace
  -- $white+       ;

  -- comment
  -- "--" [^\n]*   ;

  -- keyword
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  -- and       break     do        else      elseif    end
  -- false     for       function  goto      if        in
  -- local     nil       not       or        repeat    return
  -- then      true      until     while
  "and"           { TokenAnd }                -- 1
  "break"         { TokenBreak }              -- 2
  "do"            { TokenDo }                 -- 3
  "else"          { TokenElse }               -- 4
  "elseif"        { TokenElseif }             -- 5
  "end"           { TokenEnd }                -- 6

  "false"         { TokenFalse }              -- 7
  "for"           { TokenFor }                -- 8
  "function"      { TokenFunction }           -- 9
  "goto"          { TokenGoto }               -- 10
  "if"            { TokenIf }                 -- 11
  "in"            { TokenIn }                 -- 12

  "local"         { TokenLocal }              -- 13
  "nil"           { TokenNil }                -- 14
  "not"           { TokenNot }                -- 15
  "or"            { TokenOr }                 -- 16
  "repeat"        { TokenRepeat }             -- 17
  "return"        { TokenReturn }             -- 18

  "then"          { TokenThen }               -- 19
  "true"          { TokenTrue }               -- 20
  "until"         { TokenUntil }              -- 21
  "while"         { TokenWhile }              -- 22

  -- https://www.lua.org/manual/5.4/manual.html#3.1
  -- Other tokens
  -- +     -     *     /     %     ^     #
  -- &     ~     |     <<    >>    //
  -- ==    ~=    <=    >=    <     >     =
  -- (     )     {     }     [     ]     ::
  -- ;     :     ,     .     ..    ...
  '+'             { TokenAdd }                -- 23
  '-'             { TokenMinus }              -- 24
  '*'             { TokenMutiply }            -- 25
  '/'             { TokenDevide }             -- 26
  '%'             { TokenModulus }            -- 27
  '^'             { TokenPower }              -- 28
  '#'             { TokenLength }             -- 29

  '&'             { TokenBitwiseAnd }         -- 30
  '~'             { TokenBitwiseNot }         -- 31
  '|'             { TokenBitwiseOr }          -- 32
  "<<"            { TokenLeftShift }          -- 33
  ">>"            { TokenRightShift }         -- 34
  "//"            { TokenFloorDivision }      -- 35

  "=="            { TokenEquals }             -- 36
  "~="            { TokenNotEquals }          -- 37
  "<="            { TokenLessThanEquals }     -- 38
  ">="            { TokenGreaterThanEquals }  -- 39
  '<'             { TokenLessThan }           -- 40
  '>'             { TokenGreaterThan }        -- 41
  '='             { TokenAssign }             -- 42

  '('             { TokenLeftParentheses }    -- 43
  ')'             { TokenRightParentheses }   -- 44
  '{'             { TokenLeftBrace }          -- 45
  '}'             { TokenRightBrace }         -- 46
  '['             { TokenLeftBracket }        -- 47
  ']'             { TokenRightBracket }       -- 48
  "::"            { TokenDoubleColon }        -- 49

  ';'             { TokenSemicolon }          -- 50
  ':'             { TokenColon }              -- 51
  ','             { TokenComma }              -- 52
  '.'             { TokenDot }                -- 53
  ".."            { TokenConcat }             -- 54
  "..."           { TokenVararg }             -- 55

  -- integer
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  Integer         { TokenInteger $$ }         -- 56

  -- float
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  Float           { TokenFloat $$ }           -- 57

  -- identifier
  Name            { TokenIdentifier $$ }      -- 58
  LiteralString   { TokenString $$ }          -- 59

-- https://www.lua.org/manual/5.4/manual.html#3.4.8
%left "or"
%left "and"
%nonassoc '>' '<' "<=" ">=" "~=" "=="
%left '|'
%nonassoc '~'
%nonassoc '&'
%nonassoc "<<" ">>"
%nonassoc ".."
%left '+' '-'
%left '*' '/' "//" '%'
%left "not" '#' NEG '~'
%left '^'
%%

 -- https://www.lua.org/manual/5.4/manual.html#9

  -- chunk ::= block
  Chunk : Block { ChunkBlock $1 }

	-- block ::= {stat} [retstat]
  Block :                  { BlockEmpty }
        | StatList         { BlockStatList $1 }
        | StatList Retstat { BlockStatListRetstat $1 $2 }
        | Retstat          { BlockRetstate }
  StatList : Stat { StatListSingle $1 }
           | Stat StatList { StatListCons $1 $2 }

	-- stat ::=  ';' | 
	-- 	 varlist '=' explist | 
	-- 	 functioncall | 
	-- 	 label | 
	-- 	 break | 
	-- 	 goto Name | 
	-- 	 do block end | 
	-- 	 while exp do block end | 
	-- 	 repeat block until exp | 
	-- 	 if exp then block {elseif exp then block} [else block] end | 
	-- 	 for Name '=' exp ',' exp [',' exp] do block end | 
	-- 	 for namelist in explist do block end | 
	-- 	 function funcname funcbody | 
	-- 	 local function Name funcbody | 
	-- 	 local attnamelist ['=' explist] 
  Stat : ';' { StatSemicolonEmpty }
       | Varlist '=' Explist { StatAssignment $1 $3 }
       | Functioncall { StatFunctionCall $1 }
       | Label { StatLabel $1 }
       | "break" { StatBreak }
       | "goto" Name { StatGoto $2 }
       | "do" Block "end" { StatDo $2 }
       | "while" Exp "do" Block "end" { StatWhile $2 $4 }
       | "repeat" Block "until" Exp { StatRepeat $2 $4 }
       | "if" Exp "then" Block ElseIfList ElseBlock "end" { StatIf $2 $4 $5 $6 }
       | "for" Name '=' Exp ',' Exp ',' Exp "do" Block "end" { StatForNumeric $2 $4 $6 $8 }
       | "for" Name '=' Exp ',' Exp "do" Block "end" { StatForNumericSimple $2 $4 $6 }
       | "for" Namelist "in" Explist "do" Block "end" { StatForEach $2 $4 $6 }
       | "function" Funcname Funcbody { StatFunction $2 $3 }
       | "local" "function" Name Funcbody { StatLocalFunction $3 $4 }
       | "local" Attnamelist '=' Explist { StatLocalAttribNameList $2 $4 }
       | "local" Attnamelist { StatLocalAttribNameListSimple $2 }
  ElseIfList : { EmptyElseIfList }
             | "elseif" Exp "then" Block ElseIfList { ElseIfListAppend $2 $4 $5 }
  ElseBlock : { EmptyElseBlock }
            | "else" Block { ElseBlock $2 }

	-- attnamelist ::=  Name attrib {',' Name attrib}
  Attnamelist : Name Attrib { AttnamelistCons $1 $2 }
              | Name Attrib ',' Attnamelist { AttnamelistAppend $1 $2 $4 }

	-- attrib ::= ['<' Name '>']
  Attrib : '<' Name '>' { AttribName $2 }
         |              { AttribEmpty }

	-- retstat ::= return [explist] [';']
  Retstat : "return" Explist ';' { ReturnStatExplistSimecolon $2 }
          | "return" Explist     { ReturnStatExplist $2 }
          | "return" ';'         { ReturnStatSimecolon }
          | "return"             { ReturnStat }

	-- label ::= '::' Name '::'
  Label : "::" Name "::" { LabelName $2 }

	-- funcname ::= Name {'.' Name} [':' Name]
  Funcname : Name                           { FuncnameDot $1 }
           | Name FuncnameDotList ':' Name  { FuncnameColon $1 $2 $4 }
           | Name FuncnameDotList           { FuncnameDotListOnly $1 $2 }
  FuncnameDotList :                           { FuncnameDotListEmpty }
                  | '.' Name                  { FuncnameDotSingle $2 }
                  | FuncnameDotList '.' Name  { FuncnameDotListAppend $1 $3 }

	-- varlist ::= var {',' var}
  Varlist : Var { VarListSingle $1 }
          | Var ',' Varlist { VarListCons $1 $3 }

	-- var ::=  Name | prefixexp '[' exp ']' | prefixexp '.' Name 
  Var : Name { VarName $1 }
      | Prefixexp '[' Exp ']' { VarBracket $1 $3 }
      | Prefixexp '.' Name { VarDot $1 $3 }

	-- namelist ::= Name {',' Name}
  Namelist : Name                       { NameListSingle $1 }
           | Name ',' Namelist          { NameListCons $1 $3 }
          -- For "par, ...", add here
           | "..."                      { ParlistOnlyVararg }

	-- explist ::= exp {',' exp}
  Explist : Exp { ExpListSingle $1 }
          | Exp ',' Explist { ExpListCons $1 $3 }

	-- exp ::=  nil | false | true | Numeral | LiteralString | '...' | functiondef | 
	-- 	 prefixexp | tableconstructor | exp binop exp | unop exp 
  Exp : "nil" { ExpNil }
      | "false" { ExpFalse }
      | "true" { ExpTrue }
      | Float { ExpFloat $1 }
      | Integer { ExpInteger $1 }
      | LiteralString { ExpString $1 }
      | "..." { ExpVararg }
      | Functiondef { ExpFunctionDef $1 }
      | Prefixexp { ExpPrefix $1 }
      | Tableconstructor { ExpTable $1 }
      | Exp Binop Exp { ExpBinop $1 $2 $3 }
      | Unop Exp { ExpUnopExp $1 }

	-- prefixexp ::= var | functioncall | '(' exp ')'
  Prefixexp : Var { PrefixVar $1 }
            | Functioncall { PrefixFunctionCall $1 }
            | '(' Exp ')' { PrefixExp $2 }

	-- functioncall ::=  prefixexp args | prefixexp ':' Name args 
  Functioncall : Prefixexp Args { FunctionCall $1 $2 }
               | Prefixexp ':' Name Args { FunctionCallMethod $1 $3 $4 }

	-- args ::=  '(' [explist] ')' | tableconstructor | LiteralString 
  Args : '(' ')' { ArgsEmpty }
       | '(' Explist ')' { ArgsExpList $2 }
       | Tableconstructor { ArgsTable $1 }
       | LiteralString { ArgsString $1 }

	-- functiondef ::= function funcbody
  Functiondef : "function" Funcbody { FunctionDef $2 }

	-- funcbody ::= '(' [parlist] ')' block end
  Funcbody : '(' ')' Block "end" { FuncbodyNoParlist $3 }
           | '(' Parlist ')' Block "end" { FuncbodyParlist $2 $4 }

	-- parlist ::= namelist [',' '...'] | '...'
  Parlist : Namelist { ParlistNamelist $1 }
          -- For "par, ...", delete here
          -- | Namelist ',' "..." { ParlistVararg $1 }
          -- | "..." { ParlistOnlyVararg }

	-- tableconstructor ::= '{' [fieldlist] '}'
  Tableconstructor : '{' '}' { TableConstructorEmpty }
                   | '{' Fieldlist '}' { TableConstructorFieldlist $2 }

	-- fieldlist ::= field {fieldsep field} [fieldsep]
  Fieldlist : Field { FieldListSingle $1 }
            | Field Fieldsep Fieldlist { FieldListCons $1 $2 $3 }
            | Field Fieldsep { FieldListLast $1 $2 }

	-- field ::= '[' exp ']' '=' exp | Name '=' exp | exp
  Field : '[' Exp ']' '=' Exp { FieldExpKey $2 $5 }
        | Name '=' Exp { FieldNameKey $1 $3 }
        | Exp { FieldExp $1 }

	-- fieldsep ::= ',' | ';'
  Fieldsep : ',' { FieldsepComma }
           | ';' { FieldsepSemicolon }

	-- binop ::=  '+' | '-' | '*' | '/' | '//' | '^' | '%' | 
	-- 	 '&' | '~' | '|' | '>>' | '<<' | '..' | 
	-- 	 '<' | '<=' | '>' | '>=' | '==' | '~=' | 
	-- 	 and | or
  Binop : '+'   { BinopPlus }
        | '-'   { BinopBinaryMinus }
        | '*'   { BinopMultiply }
        | '/'   { BinopDivide }
        | "//"  { BinopFloorDiv }
        | '^'   { BinopPower }
        | '%'   { BinopMod }
        | '&'   { BinopBitwiseAnd }
        | '~'   { BinopBitwiseNot }
        | '|'   { BinopBitwiseOr }
        | ">>"  { BinopShiftRight }
        | "<<"  { BinopShiftLeft }
        | ".."  { BinopConcat }
        | '<'   { BinopLessThan }
        | "<="  { BinopLessThanEqual }
        | '>'   { BinopGreaterThan }
        | ">="  { BinopGreaterThanEqual }
        | "=="  { BinopEquals }
        | "~="  { BinopNotEquals }
        | "and" { BinopAnd }
        | "or"  { BinopOr }

	-- unop ::= '-' | not | '#' | '~'
  Unop : '-' %prec NEG  { UnopUnaryMinus }
       | "not"          { UnopNot }
       | '#'            { UnopLength }
       | '~'            { UnopBitwiseNot }

{

data Grammar = 
  -- chunk ::= block
    ChunkBlock Grammar

	-- block ::= {stat} [retstat]
  | BlockEmpty
  | BlockStatList Grammar
  | BlockStatListRetstat Grammar Grammar
  | BlockRetstate
  | StatListSingle Grammar
  | StatListCons Grammar Grammar

	-- stat ::=  ';' | 
  | StatSemicolonEmpty 
  | StatAssignment Grammar Grammar
  | StatFunctionCall Grammar
  | StatLabel Grammar
  | StatBreak
  | StatGoto String
  | StatDo Grammar
  | StatWhile Grammar Grammar
  | StatRepeat Grammar Grammar
  | StatIf Grammar Grammar Grammar Grammar
  | StatForNumeric String Grammar Grammar Grammar
  | StatForNumericSimple String Grammar Grammar
  | StatForEach Grammar Grammar Grammar
  | StatFunction Grammar Grammar
  | StatLocalFunction String Grammar
  | StatLocalAttribNameList Grammar Grammar
  | StatLocalAttribNameListSimple Grammar
  | EmptyElseIfList
  | ElseIfListAppend Grammar Grammar Grammar
  | EmptyElseBlock
  | ElseBlock Grammar

	-- attnamelist ::=  Name attrib {',' Name attrib}
  | AttnamelistCons String Grammar
  | AttnamelistAppend String Grammar Grammar

	-- attrib ::= ['<' Name '>']
  | AttribName String
  | AttribEmpty

	-- retstat ::= return [explist] [';']
  | ReturnStatExplistSimecolon Grammar
  | ReturnStatExplist Grammar
  | ReturnStatSimecolon
  | ReturnStat

	-- label ::= '::' Name '::'
  | LabelName String

	-- funcname ::= Name {'.' Name} [':' Name]
  | FuncnameDot String
  | FuncnameColon String Grammar String
  | FuncnameDotListOnly String Grammar
  | FuncnameDotListEmpty
  | FuncnameDotSingle String
  | FuncnameDotListAppend Grammar String

	-- varlist ::= var {',' var}
  | VarListSingle Grammar
  | VarListCons Grammar Grammar

	-- var ::=  Name | prefixexp '[' exp ']' | prefixexp '.' Name 
  | VarName String
  | VarBracket Grammar Grammar
  | VarDot Grammar String

	-- namelist ::= Name {',' Name}
  | NameListSingle String
  | NameListCons String Grammar

	-- explist ::= exp {',' exp}
  | ExpListSingle Grammar
  | ExpListCons Grammar Grammar

	-- exp ::=  nil | false | true | Numeral | LiteralString | '...' | functiondef | 
	-- 	 prefixexp | tableconstructor | exp binop exp | unop exp 
  | ExpNil
  | ExpFalse
  | ExpTrue
  | ExpFloat Float
  | ExpInteger Integer
  | ExpString String
  | ExpVararg
  | ExpFunctionDef Grammar
  | ExpPrefix Grammar
  | ExpTable Grammar
  | ExpBinop Grammar Grammar Grammar
  | ExpUnopExp Grammar

	-- prefixexp ::= var | functioncall | '(' exp ')'
  | PrefixVar Grammar
  | PrefixFunctionCall Grammar
  | PrefixExp Grammar

	-- functioncall ::=  prefixexp args | prefixexp ':' Name args 
  | FunctionCall Grammar Grammar
  | FunctionCallMethod Grammar String Grammar

	-- args ::=  '(' [explist] ')' | tableconstructor | LiteralString 
  | ArgsEmpty
  | ArgsExpList Grammar
  | ArgsTable Grammar
  | ArgsString String

	-- functiondef ::= function funcbody
  | FunctionDef Grammar

	-- funcbody ::= '(' [parlist] ')' block end
  | FuncbodyNoParlist Grammar
  | FuncbodyParlist Grammar Grammar

	-- parlist ::= namelist [',' '...'] | '...'
  | ParlistNamelist Grammar
  | ParlistVararg Grammar
  | ParlistOnlyVararg

	-- tableconstructor ::= '{' [fieldlist] '}'
  | TableConstructorEmpty
  | TableConstructorFieldlist Grammar

	-- fieldlist ::= field {fieldsep field} [fieldsep]
  | FieldListSingle Grammar
  | FieldListCons Grammar Grammar Grammar
  | FieldListLast Grammar Grammar

	-- field ::= '[' exp ']' '=' exp | Name '=' exp | exp
  | FieldExpKey Grammar Grammar
  | FieldNameKey String Grammar
  | FieldExp Grammar

	-- fieldsep ::= ',' | ';'
  | FieldsepComma
  | FieldsepSemicolon

	-- binop ::=  '+' | '-' | '*' | '/' | '//' | '^' | '%' | 
	-- 	 '&' | '~' | '|' | '>>' | '<<' | '..' | 
	-- 	 '<' | '<=' | '>' | '>=' | '==' | '~=' | 
	-- 	 and | or
  | BinopExpExp
  | BinopPlus
  | BinopBinaryMinus
  | BinopMultiply
  | BinopDivide
  | BinopFloorDiv
  | BinopPower
  | BinopMod
  | BinopBitwiseAnd
  | BinopBitwiseNot
  | BinopBitwiseOr
  | BinopShiftRight
  | BinopShiftLeft
  | BinopConcat
  | BinopLessThan
  | BinopLessThanEqual
  | BinopGreaterThan
  | BinopGreaterThanEqual
  | BinopEquals
  | BinopNotEquals
  | BinopAnd
  | BinopOr

	-- unop ::= '-' | not | '#' | '~'
  | UnopExpExp
  | UnopUnaryMinus
  | UnopNot
  | UnopLength
  | UnopBitwiseNot
  deriving (Show, Eq)

parseError :: [Token] -> a
parseError _ = error "Parse error"
}