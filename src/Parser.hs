{-# OPTIONS_GHC -w #-}
{-# OPTIONS -cpp #-}
module Parser where
import Lexer

#define HAPPY_DEBUG 1
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified System.IO as Happy_System_IO
import qualified System.IO.Unsafe as Happy_System_IO_Unsafe
import qualified Debug.Trace as Happy_Debug_Trace
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,926) ([0,0,6022,33,1024,515,0,24576,4472,2,12352,32,0,0,0,0,0,0,0,0,32,0,0,0,0,6022,33,1024,515,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,128,0,0,0,0,21504,1044,0,0,0,0,0,0,0,0,0,0,0,0,0,30816,529,16384,8240,0,0,0,0,0,512,0,0,0,0,0,32,0,0,0,0,0,2,0,5120,2182,16389,31745,0,0,256,0,0,512,0,24576,4472,2,12352,32,0,16384,34913,80,49172,7,0,5120,2182,16389,31745,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,256,49280,65519,8201,0,0,0,0,0,16709,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5120,2182,16389,31745,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24896,20616,21504,1984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20480,2048,65276,31,2,0,0,4096,0,0,0,0,0,0,8192,0,0,0,0,0,0,512,0,0,0,0,8,0,0,256,50304,65519,8193,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,1,0,0,8,0,0,0,0,0,0,8192,128,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5120,2182,16389,31745,0,0,24896,20616,5120,1984,0,0,0,0,0,32,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,1024,512,0,0,34324,1288,320,124,0,0,0,0,0,0,0,0,0,0,0,0,0,24896,20616,5120,1986,0,0,0,0,8192,0,0,256,49280,65519,10241,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,16385,0,0,32769,61376,33279,32,0,0,0,0,128,0,0,0,0,0,0,0,0,5120,2182,16389,31745,0,0,0,0,0,512,0,0,34324,1288,320,124,0,0,0,0,5120,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,36,0,16384,34913,80,49172,7,0,0,0,0,0,0,0,0,0,0,0,0,24576,4472,2,12352,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,2,0,0,0,16384,0,0,0,24896,20616,5120,1984,0,0,34324,1288,320,124,0,34304,8471,0,772,2,0,16,64520,8190,512,0,0,0,0,8192,0,0,0,0,0,40960,0,0,16384,34913,80,49172,7,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24896,20616,5120,1984,0,4096,2048,65276,2079,2,0,16384,34913,80,49236,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,16,64520,8190,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,8192,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,512,0,16384,0,0,0,0,0,0,0,0,0,0,0,16,64520,8190,640,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5120,2182,16389,31745,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,34913,80,49172,7,0,30816,529,16384,8240,0,0,0,0,0,0,0,0,0,0,0,0,0,34304,8471,0,772,2,0,0,0,0,1024,0,0,8,0,0,0,0,0,34324,1288,320,124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,16,64520,8190,512,0,0,24896,20616,5120,1984,0,4096,18432,65276,31,2,0,8192,0,0,0,0,0,30816,529,16384,8240,0,0,0,0,0,0,0,0,2,0,0,0,0,8192,0,0,0,0,0,80,64520,8190,640,0,0,6022,33,1024,515,0,0,34324,1288,320,124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34304,8471,0,772,2,0,16,64520,8190,512,0,0,16,0,0,0,0,20480,2048,65276,31,2,0,8192,0,0,0,0,0,0,0,0,0,0,0,6022,33,1024,515,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Chunk","Block","StatList","Stat","ElseIfList","ElseBlock","Attnamelist","Attrib","Retstat","Label","Funcname","FuncnameDotList","Varlist","Var","Namelist","Explist","Exp","Prefixexp","Functioncall","Args","Functiondef","Funcbody","Parlist","Tableconstructor","Fieldlist","Field","Fieldsep","Binop","Unop","\"and\"","\"break\"","\"do\"","\"else\"","\"elseif\"","\"end\"","\"false\"","\"for\"","\"function\"","\"goto\"","\"if\"","\"in\"","\"local\"","\"nil\"","\"not\"","\"or\"","\"repeat\"","\"return\"","\"then\"","\"true\"","\"until\"","\"while\"","'+'","'-'","'*'","'/'","'%'","'^'","'#'","'&'","'~'","'|'","\"<<\"","\">>\"","\"//\"","\"==\"","\"~=\"","\"<=\"","\">=\"","'<'","'>'","'='","'('","')'","'{'","'}'","'['","']'","\"::\"","';'","':'","','","'.'","\"..\"","\"...\"","Integer","Float","Name","LiteralString","%eof"]
        bit_start = st Prelude.* 92
        bit_end = (st Prelude.+ 1) Prelude.* 92
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..91]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyActOffsets = Happy_Data_Array.listArray (0,192) ([-1,-1,0,-12,-1,0,-24,73,30,113,0,-1,-13,21,32,598,13,-1,598,598,33,0,0,-26,-3,0,69,459,0,0,0,598,0,44,0,0,0,0,0,0,474,0,0,0,0,111,77,75,53,79,152,0,72,68,110,-25,122,0,0,598,598,71,82,0,-30,598,0,0,527,80,193,0,0,0,0,29,234,87,0,598,96,598,25,97,0,-8,598,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,99,116,598,598,-1,439,115,34,598,120,0,439,0,0,598,275,545,0,0,0,157,439,0,0,126,112,164,439,121,130,0,129,0,137,141,197,0,316,0,0,0,598,0,0,598,-1,0,0,-1,146,198,598,0,0,0,0,161,439,598,357,199,-1,0,204,205,28,-1,598,0,0,0,0,-1,439,209,398,216,0,-1,0,231,0,0
	])

happyGotoOffsets :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyGotoOffsets = Happy_Data_Array.listArray (0,192) ([23,2,0,207,400,0,0,0,14,0,0,195,228,242,0,749,238,277,758,767,0,0,0,0,0,0,229,14,0,0,0,776,0,256,0,0,0,0,0,0,686,0,0,0,0,254,0,0,0,248,257,0,262,252,0,0,0,0,0,223,785,0,0,0,236,346,0,0,713,0,258,0,0,0,0,20,258,0,0,794,273,722,0,0,0,16,803,0,0,318,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,271,731,812,441,266,0,270,821,0,0,291,0,0,830,291,699,0,0,0,0,291,0,0,0,298,293,295,0,0,0,0,0,0,0,0,0,295,0,0,0,740,0,0,839,483,0,0,607,0,319,848,0,0,0,0,0,299,857,299,0,633,0,0,0,299,657,866,0,0,0,0,670,299,321,301,0,0,683,0,0,0,0
	])

happyAdjustOffset :: Prelude.Int -> Prelude.Int
happyAdjustOffset = Prelude.id

happyDefActions :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyDefActions = Happy_Data_Array.listArray (0,192) ([0,0,-2,-4,-5,-10,0,-42,0,-9,-11,0,0,0,0,0,0,0,0,0,0,-7,-44,0,0,-63,0,-59,-64,-58,-60,0,-52,0,-51,-106,-53,-105,-107,-108,0,-57,-55,-54,-56,0,0,-23,0,-31,0,-12,0,-37,0,-47,0,-66,-69,0,0,0,0,-70,0,0,-6,-3,-35,-33,-49,-34,-8,-43,-46,0,0,0,-13,0,0,0,-39,0,-20,0,0,-103,-104,0,-84,-85,-86,-87,-90,-89,-91,-92,-93,-95,-94,-88,-101,-102,-98,-100,-97,-99,-96,-28,0,0,0,0,0,-81,0,-76,0,-44,-71,-62,-65,-36,0,0,-78,-83,-82,-75,0,-15,-22,-21,0,0,-24,-61,0,0,-74,-47,-40,0,0,0,-48,0,-68,-45,-67,0,-32,-50,0,0,-41,-38,0,0,-26,0,-29,-30,-14,-77,0,-80,0,0,0,0,-73,0,0,0,0,0,-19,-72,-27,-16,0,-79,-24,0,0,-18,0,-25,0,-17
	])

happyCheck :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyCheck = Happy_Data_Array.listArray (0,926) ([-1,2,3,1,2,3,18,8,9,10,11,9,13,43,12,13,17,42,42,17,18,22,9,0,1,2,3,52,58,1,14,3,9,19,60,12,13,23,22,19,17,18,43,23,16,58,49,55,49,50,58,23,24,25,26,27,28,58,30,31,32,33,34,35,36,37,38,39,40,41,1,58,43,43,45,45,51,47,53,58,52,51,54,53,50,16,52,43,59,59,58,58,23,24,25,26,27,28,21,30,31,32,33,34,35,36,37,38,39,40,41,58,1,44,3,43,43,42,45,40,47,53,12,54,51,52,53,16,6,58,50,44,59,52,23,24,25,26,27,28,58,30,31,32,33,34,35,36,37,38,39,40,41,1,58,58,43,58,45,43,47,46,42,6,51,54,53,41,16,5,58,19,59,52,44,23,24,25,26,27,28,52,30,31,32,33,34,35,36,37,38,39,40,41,1,58,1,2,3,58,3,55,4,42,9,6,54,12,13,16,6,6,17,18,5,8,23,24,25,26,27,28,6,30,31,32,33,34,35,36,37,38,39,40,41,1,13,6,15,16,17,18,14,20,6,52,23,54,12,13,16,28,10,17,18,7,27,23,24,25,26,27,28,11,30,31,32,33,34,35,36,37,38,39,40,41,1,21,1,2,3,27,48,21,27,27,9,14,54,12,13,16,21,27,17,18,26,4,23,24,25,26,27,28,6,30,31,32,33,34,35,36,37,38,39,40,41,1,27,1,2,3,27,48,5,4,27,9,27,54,12,13,16,-1,-1,17,18,-1,-1,23,24,25,26,27,28,-1,30,31,32,33,34,35,36,37,38,39,40,41,1,13,-1,15,16,17,18,-1,20,-1,52,23,54,-1,-1,16,28,-1,19,-1,-1,-1,23,24,25,26,27,28,-1,30,31,32,33,34,35,36,37,38,39,40,41,1,-1,3,2,3,-1,-1,-1,-1,-1,9,-1,54,12,13,16,-1,-1,17,18,-1,-1,23,24,25,26,27,28,-1,30,31,32,33,34,35,36,37,38,39,40,41,1,-1,1,2,3,-1,-1,-1,-1,-1,9,-1,54,12,13,16,-1,-1,17,18,-1,-1,23,24,25,26,27,28,-1,30,31,32,33,34,35,36,37,38,39,40,41,7,-1,9,1,2,3,-1,14,15,-1,-1,9,54,20,12,13,-1,24,-1,17,18,43,29,45,31,47,-1,-1,-1,51,-1,53,-1,-1,-1,-1,43,59,45,-1,47,-1,-1,-1,-1,-1,-1,-1,55,56,57,58,59,7,-1,9,-1,-1,-1,-1,14,15,-1,-1,-1,-1,20,-1,-1,-1,24,7,-1,9,-1,29,-1,31,14,15,-1,-1,-1,-1,20,-1,-1,-1,24,43,-1,45,-1,29,-1,31,50,-1,-1,-1,-1,55,56,57,58,59,-1,43,-1,45,-1,47,-1,-1,-1,-1,-1,-1,-1,55,56,57,58,59,7,-1,9,1,2,3,-1,14,15,-1,-1,9,-1,20,12,13,-1,24,-1,17,18,-1,29,-1,31,-1,-1,-1,-1,1,2,3,-1,-1,-1,-1,43,9,45,-1,12,13,-1,-1,-1,17,18,-1,55,56,57,58,59,1,2,3,-1,-1,-1,-1,-1,9,-1,-1,12,13,1,2,3,17,18,-1,-1,-1,9,-1,-1,12,13,1,2,3,17,18,-1,-1,-1,9,-1,-1,12,13,-1,-1,13,17,18,16,17,18,-1,20,-1,-1,23,24,25,13,-1,28,16,17,18,-1,20,-1,-1,23,24,25,-1,13,28,15,16,17,18,-1,20,-1,13,23,15,16,17,18,28,20,-1,13,23,15,16,17,18,28,20,-1,13,23,15,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,13,23,-1,16,17,18,28,20,-1,-1,23,-1,-1,-1,-1,28,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	])

happyTable :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyTable = Happy_Data_Array.listArray (0,926) ([0,11,12,2,3,4,69,13,14,15,16,5,17,20,6,7,18,80,66,8,9,19,49,23,2,3,4,81,23,88,138,177,5,57,-1,6,7,58,139,150,8,9,20,58,89,56,124,141,21,22,142,91,92,93,94,95,96,23,97,98,99,100,101,102,103,104,105,106,107,108,88,50,60,60,41,41,144,61,145,54,178,62,109,63,128,89,129,86,64,64,52,25,91,92,93,94,95,96,114,97,98,99,100,101,102,103,104,105,106,107,108,112,88,123,115,86,-63,113,-63,111,-63,84,82,109,-63,65,-63,89,79,76,153,149,-63,136,91,92,93,94,95,96,75,97,98,99,100,101,102,103,104,105,106,107,108,88,142,143,-64,135,-64,86,-64,130,125,165,-64,109,-64,164,89,162,50,90,-64,160,159,91,92,93,94,95,96,81,97,98,99,100,101,102,103,104,105,106,107,108,88,158,56,3,4,157,156,173,172,169,5,182,109,6,7,89,180,179,8,9,162,67,91,92,93,94,95,96,188,97,98,99,100,101,102,103,104,105,106,107,108,88,25,192,77,70,27,28,54,29,47,152,30,109,73,7,89,31,52,8,28,109,86,91,92,93,94,95,96,82,97,98,99,100,101,102,103,104,105,106,107,108,88,120,46,3,4,86,150,84,86,86,5,146,109,6,7,89,133,86,8,9,126,160,91,92,93,94,95,96,162,97,98,99,100,101,102,103,104,105,106,107,108,88,86,136,3,4,86,167,170,189,86,5,86,109,6,7,89,0,0,8,9,0,0,91,92,93,94,95,96,0,97,98,99,100,101,102,103,104,105,106,107,108,88,25,0,72,70,27,28,0,29,0,155,30,109,0,0,89,31,0,183,0,0,0,91,92,93,94,95,96,0,97,98,99,100,101,102,103,104,105,106,107,108,88,0,189,66,4,0,0,0,0,0,5,0,109,6,7,89,0,0,8,9,0,0,91,92,93,94,95,96,0,97,98,99,100,101,102,103,104,105,106,107,108,88,0,130,3,4,0,0,0,0,0,5,0,109,6,7,89,0,0,8,9,0,0,91,92,93,94,95,96,0,97,98,99,100,101,102,103,104,105,106,107,108,33,0,34,174,3,4,0,35,36,0,0,5,109,37,6,7,0,38,0,8,9,60,39,41,40,61,0,0,0,62,0,63,0,0,0,0,20,64,41,0,119,0,0,0,0,0,0,0,42,43,44,120,45,33,0,34,0,0,0,0,35,36,0,0,0,0,37,0,0,0,38,33,0,34,0,39,0,40,35,36,0,0,0,0,37,0,0,0,38,20,0,41,0,39,0,40,72,0,0,0,0,42,43,44,23,45,0,20,0,41,0,119,0,0,0,0,0,0,0,42,43,44,120,45,33,0,34,173,3,4,0,35,36,0,0,5,0,37,6,7,0,38,0,8,9,0,39,0,40,0,0,0,0,180,3,4,0,0,0,0,20,5,41,0,6,7,0,0,0,8,9,0,42,43,44,23,45,186,3,4,0,0,0,0,0,5,0,0,6,7,184,3,4,8,9,0,0,0,5,0,0,6,7,190,3,4,8,9,0,0,0,5,0,0,6,7,0,0,25,8,9,115,27,28,0,29,0,0,30,116,117,25,0,31,115,27,28,0,29,0,0,30,165,117,0,25,31,69,70,27,28,0,29,0,25,30,145,70,27,28,31,29,0,25,30,132,70,27,28,31,29,0,25,30,153,70,27,28,31,29,0,25,30,0,50,27,28,31,29,0,25,30,0,45,27,28,31,29,0,25,30,0,26,27,28,31,29,0,25,30,0,121,27,28,31,29,0,25,30,0,76,27,28,31,29,0,25,30,0,147,27,28,31,29,0,25,30,0,137,27,28,31,29,0,25,30,0,131,27,28,31,29,0,25,30,0,125,27,28,31,29,0,25,30,0,167,27,28,31,29,0,25,30,0,175,27,28,31,29,0,25,30,0,169,27,28,31,29,0,25,30,0,183,27,28,31,29,0,25,30,0,185,27,28,31,29,0,0,30,0,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

happyReduceArr = Happy_Data_Array.array (1, 107) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107)
	]

happy_n_terms = 61 :: Prelude.Int
happy_n_nonterms = 29 :: Prelude.Int

happyReduce_1 = happySpecReduce_1  0 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (ChunkBlock happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  1 happyReduction_2
happyReduction_2 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (BlockStatListRetstat happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  1 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (BlockStatList happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  2 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (StatListSingle happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  2 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (StatListCons happy_var_1 happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  3 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn7
		 (StatSemicolonEmpty
	)

happyReduce_7 = happySpecReduce_3  3 happyReduction_7
happyReduction_7 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn7
		 (StatAssignment happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  3 happyReduction_8
happyReduction_8 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn7
		 (StatFunctionCall happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  3 happyReduction_9
happyReduction_9 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (StatLabel happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  3 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn7
		 (StatBreak
	)

happyReduce_11 = happySpecReduce_2  3 happyReduction_11
happyReduction_11 (HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn7
		 (StatGoto happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  3 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatDo happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 3 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatWhile happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 3 happyReduction_14
happyReduction_14 ((HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatRepeat happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 7 3 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatIf happy_var_2 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 11 3 happyReduction_16
happyReduction_16 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatForNumeric happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 9 3 happyReduction_17
happyReduction_17 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatForNumericSimple happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 3 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatForEach happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  3 happyReduction_19
happyReduction_19 (HappyAbsSyn25  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatFunction happy_var_2 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 3 happyReduction_20
happyReduction_20 ((HappyAbsSyn25  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatLocalFunction happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 3 happyReduction_21
happyReduction_21 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatLocalAttribNameList happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  3 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatLocalAttribNameListSimple happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_0  4 happyReduction_23
happyReduction_23  =  HappyAbsSyn8
		 (EmptyElseIfList
	)

happyReduce_24 = happyReduce 5 4 happyReduction_24
happyReduction_24 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ElseIfListAppend happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_0  5 happyReduction_25
happyReduction_25  =  HappyAbsSyn9
		 (EmptyElseBlock
	)

happyReduce_26 = happySpecReduce_2  5 happyReduction_26
happyReduction_26 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (ElseBlock happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  6 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_2)
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn10
		 (AttnamelistCons happy_var_1 happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 6 happyReduction_28
happyReduction_28 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (AttnamelistAppend happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 _
	(HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn11
		 (AttribName happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_0  7 happyReduction_30
happyReduction_30  =  HappyAbsSyn11
		 (AttribEmpty
	)

happyReduce_31 = happySpecReduce_3  8 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (ReturnStatExplistSimecolon happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  8 happyReduction_32
happyReduction_32 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (ReturnStatExplist happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  8 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn12
		 (ReturnStatSimecolon
	)

happyReduce_34 = happySpecReduce_1  8 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn12
		 (ReturnStat
	)

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 _
	(HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn13
		 (LabelName happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn14
		 (FuncnameDot happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 10 happyReduction_37
happyReduction_37 ((HappyTerminal (TokenIdentifier happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (FuncnameColon happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_2  10 happyReduction_38
happyReduction_38 (HappyAbsSyn15  happy_var_2)
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn14
		 (FuncnameDotListOnly happy_var_1 happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  11 happyReduction_39
happyReduction_39 (HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn15
		 (FuncnameDotSingle happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  11 happyReduction_40
happyReduction_40 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (FuncnameDotListAppend happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  12 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (VarListSingle happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  12 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (VarListCons happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  13 happyReduction_43
happyReduction_43 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn17
		 (VarName happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happyReduce 4 13 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (VarBracket happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_3  13 happyReduction_45
happyReduction_45 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (VarDot happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  14 happyReduction_46
happyReduction_46 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn18
		 (NameListSingle happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  14 happyReduction_47
happyReduction_47 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn18
		 (NameListCons happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (ExpListSingle happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  15 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (ExpListCons happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  16 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (ExpNil
	)

happyReduce_51 = happySpecReduce_1  16 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 (ExpFalse
	)

happyReduce_52 = happySpecReduce_1  16 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 (ExpTrue
	)

happyReduce_53 = happySpecReduce_1  16 happyReduction_53
happyReduction_53 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn20
		 (ExpFloat happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  16 happyReduction_54
happyReduction_54 (HappyTerminal (TokenInteger happy_var_1))
	 =  HappyAbsSyn20
		 (ExpInteger happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  16 happyReduction_55
happyReduction_55 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn20
		 (ExpString happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  16 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn20
		 (ExpVararg
	)

happyReduce_57 = happySpecReduce_1  16 happyReduction_57
happyReduction_57 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpFunctionDef happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  16 happyReduction_58
happyReduction_58 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpPrefix happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  16 happyReduction_59
happyReduction_59 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpTable happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  16 happyReduction_60
happyReduction_60 _
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpBinop happy_var_1
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_2  16 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpUnopExp happy_var_1
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  17 happyReduction_62
happyReduction_62 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn21
		 (PrefixVar happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  17 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (PrefixFunctionCall happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  17 happyReduction_64
happyReduction_64 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (PrefixExp happy_var_2
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  18 happyReduction_65
happyReduction_65 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn22
		 (FunctionCall happy_var_1 happy_var_2
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happyReduce 4 18 happyReduction_66
happyReduction_66 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (FunctionCallMethod happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_67 = happySpecReduce_3  19 happyReduction_67
happyReduction_67 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (ArgsExpList happy_var_2
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  19 happyReduction_68
happyReduction_68 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn23
		 (ArgsTable happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  19 happyReduction_69
happyReduction_69 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn23
		 (ArgsString happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  20 happyReduction_70
happyReduction_70 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (FunctionDef happy_var_2
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happyReduce 5 21 happyReduction_71
happyReduction_71 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (Funcbody happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_72 = happySpecReduce_3  22 happyReduction_72
happyReduction_72 _
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn26
		 (ParlistVararg happy_var_1
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  22 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn26
		 (ParlistOnlyVararg
	)

happyReduce_74 = happySpecReduce_3  23 happyReduction_74
happyReduction_74 _
	(HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (TableConstructor happy_var_2
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  24 happyReduction_75
happyReduction_75 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListSingle happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  24 happyReduction_76
happyReduction_76 (HappyAbsSyn28  happy_var_3)
	(HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListCons happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_2  24 happyReduction_77
happyReduction_77 (HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListLast happy_var_1 happy_var_2
	)
happyReduction_77 _ _  = notHappyAtAll 

happyReduce_78 = happyReduce 5 25 happyReduction_78
happyReduction_78 ((HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (FieldExpKey happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_79 = happySpecReduce_3  25 happyReduction_79
happyReduction_79 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn29
		 (FieldNameKey happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  25 happyReduction_80
happyReduction_80 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn29
		 (FieldExp happy_var_1
	)
happyReduction_80 _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  26 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn30
		 (FieldsepComma
	)

happyReduce_82 = happySpecReduce_1  26 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn30
		 (FieldsepSemicolon
	)

happyReduce_83 = happySpecReduce_1  27 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn31
		 (BinopPlus
	)

happyReduce_84 = happySpecReduce_1  27 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn31
		 (BinopBinaryMinus
	)

happyReduce_85 = happySpecReduce_1  27 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn31
		 (BinopMultiply
	)

happyReduce_86 = happySpecReduce_1  27 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn31
		 (BinopDivide
	)

happyReduce_87 = happySpecReduce_1  27 happyReduction_87
happyReduction_87 _
	 =  HappyAbsSyn31
		 (BinopFloorDiv
	)

happyReduce_88 = happySpecReduce_1  27 happyReduction_88
happyReduction_88 _
	 =  HappyAbsSyn31
		 (BinopPower
	)

happyReduce_89 = happySpecReduce_1  27 happyReduction_89
happyReduction_89 _
	 =  HappyAbsSyn31
		 (BinopMod
	)

happyReduce_90 = happySpecReduce_1  27 happyReduction_90
happyReduction_90 _
	 =  HappyAbsSyn31
		 (BinopBitwiseAnd
	)

happyReduce_91 = happySpecReduce_1  27 happyReduction_91
happyReduction_91 _
	 =  HappyAbsSyn31
		 (BinopBitwiseNot
	)

happyReduce_92 = happySpecReduce_1  27 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn31
		 (BinopBitwiseOr
	)

happyReduce_93 = happySpecReduce_1  27 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn31
		 (BinopShiftRight
	)

happyReduce_94 = happySpecReduce_1  27 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn31
		 (BinopShiftLeft
	)

happyReduce_95 = happySpecReduce_1  27 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn31
		 (BinopConcat
	)

happyReduce_96 = happySpecReduce_1  27 happyReduction_96
happyReduction_96 _
	 =  HappyAbsSyn31
		 (BinopLessThan
	)

happyReduce_97 = happySpecReduce_1  27 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn31
		 (BinopLessThanEqual
	)

happyReduce_98 = happySpecReduce_1  27 happyReduction_98
happyReduction_98 _
	 =  HappyAbsSyn31
		 (BinopGreaterThan
	)

happyReduce_99 = happySpecReduce_1  27 happyReduction_99
happyReduction_99 _
	 =  HappyAbsSyn31
		 (BinopGreaterThanEqual
	)

happyReduce_100 = happySpecReduce_1  27 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn31
		 (BinopEquals
	)

happyReduce_101 = happySpecReduce_1  27 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn31
		 (BinopNotEquals
	)

happyReduce_102 = happySpecReduce_1  27 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn31
		 (BinopAnd
	)

happyReduce_103 = happySpecReduce_1  27 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn31
		 (BinopOr
	)

happyReduce_104 = happySpecReduce_1  28 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn32
		 (UnopUnaryMinus
	)

happyReduce_105 = happySpecReduce_1  28 happyReduction_105
happyReduction_105 _
	 =  HappyAbsSyn32
		 (UnopNot
	)

happyReduce_106 = happySpecReduce_1  28 happyReduction_106
happyReduction_106 _
	 =  HappyAbsSyn32
		 (UnopLength
	)

happyReduce_107 = happySpecReduce_1  28 happyReduction_107
happyReduction_107 _
	 =  HappyAbsSyn32
		 (UnopBitwiseNot
	)

happyNewToken action sts stk [] =
	happyDoAction 60 notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	TokenAnd -> cont 1;
	TokenBreak -> cont 2;
	TokenDo -> cont 3;
	TokenElse -> cont 4;
	TokenElseif -> cont 5;
	TokenEnd -> cont 6;
	TokenFalse -> cont 7;
	TokenFor -> cont 8;
	TokenFunction -> cont 9;
	TokenGoto -> cont 10;
	TokenIf -> cont 11;
	TokenIn -> cont 12;
	TokenLocal -> cont 13;
	TokenNil -> cont 14;
	TokenNot -> cont 15;
	TokenOr -> cont 16;
	TokenRepeat -> cont 17;
	TokenReturn -> cont 18;
	TokenThen -> cont 19;
	TokenTrue -> cont 20;
	TokenUntil -> cont 21;
	TokenWhile -> cont 22;
	TokenAdd -> cont 23;
	TokenMinus -> cont 24;
	TokenMutiply -> cont 25;
	TokenDevide -> cont 26;
	TokenModulus -> cont 27;
	TokenPower -> cont 28;
	TokenLength -> cont 29;
	TokenBitwiseAnd -> cont 30;
	TokenBitwiseNot -> cont 31;
	TokenBitwiseOr -> cont 32;
	TokenLeftShift -> cont 33;
	TokenRightShift -> cont 34;
	TokenFloorDivision -> cont 35;
	TokenEquals -> cont 36;
	TokenNotEquals -> cont 37;
	TokenLessThanEquals -> cont 38;
	TokenGreaterThanEquals -> cont 39;
	TokenLessThan -> cont 40;
	TokenGreaterThan -> cont 41;
	TokenAssign -> cont 42;
	TokenLeftParentheses -> cont 43;
	TokenRightParentheses -> cont 44;
	TokenLeftBrace -> cont 45;
	TokenRightBrace -> cont 46;
	TokenLeftBracket -> cont 47;
	TokenRightBracket -> cont 48;
	TokenDoubleColon -> cont 49;
	TokenSemicolon -> cont 50;
	TokenColon -> cont 51;
	TokenComma -> cont 52;
	TokenDot -> cont 53;
	TokenConcat -> cont 54;
	TokenVararg -> cont 55;
	TokenInteger happy_dollar_dollar -> cont 56;
	TokenFloat happy_dollar_dollar -> cont 57;
	TokenIdentifier happy_dollar_dollar -> cont 58;
	TokenString happy_dollar_dollar -> cont 59;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 60 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse 0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
  deriving (Show)

parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList

































happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO $ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    return expr




infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (0) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = (happyTrace ("state: " ++ show (st) ++ 
                      ",\ttoken: " ++ show (i) ++
                      ",\taction: ")) $
          case action of
                (0)           -> (happyTrace ("fail.\n")) $
                                     happyFail (happyExpListPerState ((st) :: Prelude.Int)) i tk st
                (-1)          -> (happyTrace ("accept.\n")) $
                                     happyAccept i tk st
                n | (n Prelude.< ((0) :: Prelude.Int)) -> (happyTrace ("reduce (rule " ++ show rule
                                                               ++ ")")) $
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = ((Prelude.negate ((n Prelude.+ ((1) :: Prelude.Int)))))
                n                 -> (happyTrace ("shift, enter state "
                                                 ++ show (new_state)
                                                 ++ "\n")) $
                                     happyShift new_state i tk st
                                     where new_state = (n Prelude.- ((1) :: Prelude.Int))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Prelude.+ i)
         check  = if (off_i Prelude.>= ((0) :: Prelude.Int))
                  then (indexShortOffAddr happyCheck off_i Prelude.== i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st












indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (0) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (0) tk st sts stk
     = happyFail [] (0) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Prelude.+ nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   (happyTrace (", goto state " ++ show (new_state) ++ "\n")) $
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Prelude.+ nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (0) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction (0) tk action sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
