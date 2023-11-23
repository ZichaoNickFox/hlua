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
  "and"           { TokenAnd }
  "break"         { TokenBreak }
  "do"            { TokenDo }
  "else"          { TokenElse }
  "elseif"        { TokenElseif }
  "end"           { TokenEnd }

  "false"         { TokenFalse }
  "for"           { TokenFor }
  "function"      { TokenFunction }
  "goto"          { TokenGoto }
  "if"            { TokenIf }
  "in"            { TokenIn }

  "local"         { TokenLocal }
  "nil"           { TokenNil }
  "not"           { TokenNot }
  "or"            { TokenOr }
  "repeat"        { TokenRepeat }
  "return"        { TokenReturn }

  "then"          { TokenThen }
  "true"          { TokenTrue }
  "until"         { TokenUntil }
  "while"         { TokenWhile }

  -- https://www.lua.org/manual/5.4/manual.html#3.1
  -- Other tokens
  -- +     -     *     /     %     ^     #
  -- &     ~     |     <<    >>    //
  -- ==    ~=    <=    >=    <     >     =
  -- (     )     {     }     [     ]     ::
  -- ;     :     ,     .     ..    ...
  '+'             { TokenAdd }
  '-'             { TokenMinus }
  '*'             { TokenMutiply }
  '/'             { TokenDevide }
  '%'             { TokenModulus }
  '^'             { TokenPower }
  '#'             { TokenLength }

  '&'             { TokenBitwiseAnd }
  '~'             { TokenBitwiseNot }
  '|'             { TokenBitwiseOr }
  "<<"            { TokenLeftShift }
  ">>"            { TokenRightShift }
  "//"            { TokenFloorDivision }

  "=="            { TokenEquals }
  "~="            { TokenNotEquals }
  "<="            { TokenLessThanEquals }
  ">="            { TokenGreaterThanEquals }
  '<'             { TokenLessThan }
  '>'             { TokenGreaterThan }
  '='             { TokenAssign }

  '('             { TokenLeftParentheses }
  ')'             { TokenRightParentheses }
  '{'             { TokenLeftBrace }
  '}'             { TokenRightBrace }
  '['             { TokenLeftBracket }
  ']'             { TokenRightBracket }
  "::"            { TokenDoubleColon }

  ';'             { TokenSemicolon }
  ':'             { TokenColon }
  ','             { TokenComma }
  '.'             { TokenDot }
  ".."            { TokenConcat }
  "..."           { TokenVararg }

  -- integer
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  Integer         { TokenInteger $$ }

  -- float
  -- https://www.lua.org/manual/5.4/manual.html#3.1
  Float           { TokenFloat $$ }

  -- identifier
  Name            { TokenIdentifier $$ }
  LiteralString   { TokenString $$ }

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
  Block : StatList Retstat { BlockStatListRetstat $1 $2 }
        | StatList          { BlockStatList $1 }
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

	-- retstat ::= return [explist] [';']
  Retstat : "return" Explist ';' { ReturnStatExplistSimecolon $2 }
          | "return" Explist     { ReturnStatExplist $2 }
          | "return" ';'         { ReturnStatSimecolon }
          | "return"             { ReturnStat }

	-- label ::= '::' Name '::'
  Label : "::" Name "::" { LabelName $2 }

	-- funcname ::= Name {'.' Name} [':' Name]
  Funcname : Name { FuncnameDot $1 }
           | Name FuncnameDotList ':' Name { FuncnameColon $1 $2 $4 }
           | Name FuncnameDotList           { FuncnameDotListOnly $1 $2 }
  FuncnameDotList : '.' Name { FuncnameDotSingle $2 }
                  | FuncnameDotList '.' Name { FuncnameDotListAppend $1 $3 }

	-- varlist ::= var {',' var}
  Varlist : Var { VarListSingle $1 }
          | Var ',' Varlist { VarListCons $1 $3 }

	-- var ::=  Name | prefixexp '[' exp ']' | prefixexp '.' Name 
  Var : Name { VarName $1 }
      | Prefixexp '[' Exp ']' { VarBracket $1 $3 }
      | Prefixexp '.' Name { VarDot $1 $3 }

	-- namelist ::= Name {',' Name}
  Namelist : Name { NameListSingle $1 }
           | Name ',' Namelist { NameListCons $1 $3 }

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
      | Exp Binop Exp { ExpBinop $1 }
      | Unop Exp { ExpUnopExp $1 }

	-- prefixexp ::= var | functioncall | '(' exp ')'
  Prefixexp : Var { PrefixVar $1 }
            | Functioncall { PrefixFunctionCall $1 }
            | '(' Exp ')' { PrefixExp $2 }

	-- functioncall ::=  prefixexp args | prefixexp ':' Name args 
  Functioncall : Prefixexp Args { FunctionCall $1 $2 }
               | Prefixexp ':' Name Args { FunctionCallMethod $1 $3 $4 }

	-- args ::=  '(' [explist] ')' | tableconstructor | LiteralString 
  Args : '(' Explist ')' { ArgsExpList $2 }
       | Tableconstructor { ArgsTable $1 }
       | LiteralString { ArgsString $1 }

	-- functiondef ::= function funcbody
  Functiondef : "function" Funcbody { FunctionDef $2 }

	-- funcbody ::= '(' [parlist] ')' block end
  Funcbody : '(' Parlist ')' Block "end" { Funcbody $2 $4 }

	-- parlist ::= namelist [',' '...'] | '...'
  Parlist : Namelist ',' "..." { ParlistVararg $1 }
          | "..." { ParlistOnlyVararg }

	-- tableconstructor ::= '{' [fieldlist] '}'
  Tableconstructor : '{' Fieldlist '}' { TableConstructor $2 }

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
  | BlockStatListRetstat Grammar Grammar
  | BlockStatList Grammar
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
  -- Here change lua's parsing grammer. Because happy and YACC use LALR. And maybe lua use LR(0)
  | ExpBinop Grammar
  | ExpUnopExp Grammar

	-- prefixexp ::= var | functioncall | '(' exp ')'
  | PrefixVar Grammar
  | PrefixFunctionCall Grammar
  | PrefixExp Grammar

	-- functioncall ::=  prefixexp args | prefixexp ':' Name args 
  | FunctionCall Grammar Grammar
  | FunctionCallMethod Grammar String Grammar

	-- args ::=  '(' [explist] ')' | tableconstructor | LiteralString 
  | ArgsExpList Grammar
  | ArgsTable Grammar
  | ArgsString String

	-- functiondef ::= function funcbody
  | FunctionDef Grammar

	-- funcbody ::= '(' [parlist] ')' block end
  | Funcbody Grammar Grammar

	-- parlist ::= namelist [',' '...'] | '...'
  | ParlistVararg Grammar
  | ParlistOnlyVararg

	-- tableconstructor ::= '{' [fieldlist] '}'
  | TableConstructor Grammar

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

parseError :: [Token] -> a
parseError _ = error "Parse error"
}