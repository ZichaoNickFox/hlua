{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
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

action_0 (34) = happyShift action_10
action_0 (35) = happyShift action_11
action_0 (40) = happyShift action_12
action_0 (41) = happyShift action_13
action_0 (42) = happyShift action_14
action_0 (43) = happyShift action_15
action_0 (45) = happyShift action_16
action_0 (49) = happyShift action_17
action_0 (54) = happyShift action_18
action_0 (75) = happyShift action_19
action_0 (81) = happyShift action_20
action_0 (82) = happyShift action_21
action_0 (90) = happyShift action_22
action_0 (4) = happyGoto action_23
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (13) = happyGoto action_5
action_0 (16) = happyGoto action_6
action_0 (17) = happyGoto action_7
action_0 (21) = happyGoto action_8
action_0 (22) = happyGoto action_9
action_0 _ = happyReduce_4

action_1 (34) = happyShift action_10
action_1 (35) = happyShift action_11
action_1 (40) = happyShift action_12
action_1 (41) = happyShift action_13
action_1 (42) = happyShift action_14
action_1 (43) = happyShift action_15
action_1 (45) = happyShift action_16
action_1 (49) = happyShift action_17
action_1 (54) = happyShift action_18
action_1 (75) = happyShift action_19
action_1 (81) = happyShift action_20
action_1 (82) = happyShift action_21
action_1 (90) = happyShift action_22
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (13) = happyGoto action_5
action_1 (16) = happyGoto action_6
action_1 (17) = happyGoto action_7
action_1 (21) = happyGoto action_8
action_1 (22) = happyGoto action_9
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (50) = happyShift action_68
action_3 (12) = happyGoto action_67
action_3 _ = happyReduce_3

action_4 (34) = happyShift action_10
action_4 (35) = happyShift action_11
action_4 (40) = happyShift action_12
action_4 (41) = happyShift action_13
action_4 (42) = happyShift action_14
action_4 (43) = happyShift action_15
action_4 (45) = happyShift action_16
action_4 (49) = happyShift action_17
action_4 (54) = happyShift action_18
action_4 (75) = happyShift action_19
action_4 (81) = happyShift action_20
action_4 (82) = happyShift action_21
action_4 (90) = happyShift action_22
action_4 (6) = happyGoto action_66
action_4 (7) = happyGoto action_4
action_4 (13) = happyGoto action_5
action_4 (16) = happyGoto action_6
action_4 (17) = happyGoto action_7
action_4 (21) = happyGoto action_8
action_4 (22) = happyGoto action_9
action_4 _ = happyReduce_5

action_5 _ = happyReduce_10

action_6 (74) = happyShift action_65
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (75) = happyReduce_63
action_7 (77) = happyReduce_63
action_7 (79) = happyReduce_63
action_7 (83) = happyReduce_63
action_7 (84) = happyShift action_64
action_7 (85) = happyReduce_63
action_7 (91) = happyReduce_63
action_7 _ = happyReduce_42

action_8 (75) = happyShift action_59
action_8 (77) = happyShift action_40
action_8 (79) = happyShift action_60
action_8 (83) = happyShift action_61
action_8 (85) = happyShift action_62
action_8 (91) = happyShift action_63
action_8 (23) = happyGoto action_57
action_8 (27) = happyGoto action_58
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (75) = happyReduce_64
action_9 (77) = happyReduce_64
action_9 (79) = happyReduce_64
action_9 (83) = happyReduce_64
action_9 (85) = happyReduce_64
action_9 (91) = happyReduce_64
action_9 _ = happyReduce_9

action_10 _ = happyReduce_11

action_11 (34) = happyShift action_10
action_11 (35) = happyShift action_11
action_11 (40) = happyShift action_12
action_11 (41) = happyShift action_13
action_11 (42) = happyShift action_14
action_11 (43) = happyShift action_15
action_11 (45) = happyShift action_16
action_11 (49) = happyShift action_17
action_11 (54) = happyShift action_18
action_11 (75) = happyShift action_19
action_11 (81) = happyShift action_20
action_11 (82) = happyShift action_21
action_11 (90) = happyShift action_22
action_11 (5) = happyGoto action_56
action_11 (6) = happyGoto action_3
action_11 (7) = happyGoto action_4
action_11 (13) = happyGoto action_5
action_11 (16) = happyGoto action_6
action_11 (17) = happyGoto action_7
action_11 (21) = happyGoto action_8
action_11 (22) = happyGoto action_9
action_11 _ = happyReduce_4

action_12 (90) = happyShift action_55
action_12 (18) = happyGoto action_54
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (90) = happyShift action_53
action_13 (14) = happyGoto action_52
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (90) = happyShift action_51
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (39) = happyShift action_32
action_15 (41) = happyShift action_33
action_15 (46) = happyShift action_34
action_15 (47) = happyShift action_35
action_15 (52) = happyShift action_36
action_15 (56) = happyShift action_37
action_15 (61) = happyShift action_38
action_15 (63) = happyShift action_39
action_15 (75) = happyShift action_19
action_15 (77) = happyShift action_40
action_15 (87) = happyShift action_41
action_15 (88) = happyShift action_42
action_15 (89) = happyShift action_43
action_15 (90) = happyShift action_22
action_15 (91) = happyShift action_44
action_15 (17) = happyGoto action_25
action_15 (20) = happyGoto action_50
action_15 (21) = happyGoto action_27
action_15 (22) = happyGoto action_28
action_15 (24) = happyGoto action_29
action_15 (27) = happyGoto action_30
action_15 (32) = happyGoto action_31
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (41) = happyShift action_48
action_16 (90) = happyShift action_49
action_16 (10) = happyGoto action_47
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (34) = happyShift action_10
action_17 (35) = happyShift action_11
action_17 (40) = happyShift action_12
action_17 (41) = happyShift action_13
action_17 (42) = happyShift action_14
action_17 (43) = happyShift action_15
action_17 (45) = happyShift action_16
action_17 (49) = happyShift action_17
action_17 (54) = happyShift action_18
action_17 (75) = happyShift action_19
action_17 (81) = happyShift action_20
action_17 (82) = happyShift action_21
action_17 (90) = happyShift action_22
action_17 (5) = happyGoto action_46
action_17 (6) = happyGoto action_3
action_17 (7) = happyGoto action_4
action_17 (13) = happyGoto action_5
action_17 (16) = happyGoto action_6
action_17 (17) = happyGoto action_7
action_17 (21) = happyGoto action_8
action_17 (22) = happyGoto action_9
action_17 _ = happyReduce_4

action_18 (39) = happyShift action_32
action_18 (41) = happyShift action_33
action_18 (46) = happyShift action_34
action_18 (47) = happyShift action_35
action_18 (52) = happyShift action_36
action_18 (56) = happyShift action_37
action_18 (61) = happyShift action_38
action_18 (63) = happyShift action_39
action_18 (75) = happyShift action_19
action_18 (77) = happyShift action_40
action_18 (87) = happyShift action_41
action_18 (88) = happyShift action_42
action_18 (89) = happyShift action_43
action_18 (90) = happyShift action_22
action_18 (91) = happyShift action_44
action_18 (17) = happyGoto action_25
action_18 (20) = happyGoto action_45
action_18 (21) = happyGoto action_27
action_18 (22) = happyGoto action_28
action_18 (24) = happyGoto action_29
action_18 (27) = happyGoto action_30
action_18 (32) = happyGoto action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (39) = happyShift action_32
action_19 (41) = happyShift action_33
action_19 (46) = happyShift action_34
action_19 (47) = happyShift action_35
action_19 (52) = happyShift action_36
action_19 (56) = happyShift action_37
action_19 (61) = happyShift action_38
action_19 (63) = happyShift action_39
action_19 (75) = happyShift action_19
action_19 (77) = happyShift action_40
action_19 (87) = happyShift action_41
action_19 (88) = happyShift action_42
action_19 (89) = happyShift action_43
action_19 (90) = happyShift action_22
action_19 (91) = happyShift action_44
action_19 (17) = happyGoto action_25
action_19 (20) = happyGoto action_26
action_19 (21) = happyGoto action_27
action_19 (22) = happyGoto action_28
action_19 (24) = happyGoto action_29
action_19 (27) = happyGoto action_30
action_19 (32) = happyGoto action_31
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (90) = happyShift action_24
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_7

action_22 _ = happyReduce_44

action_23 (92) = happyAccept
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (81) = happyShift action_123
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_63

action_26 (33) = happyShift action_87
action_26 (48) = happyShift action_88
action_26 (55) = happyShift action_90
action_26 (56) = happyShift action_91
action_26 (57) = happyShift action_92
action_26 (58) = happyShift action_93
action_26 (59) = happyShift action_94
action_26 (60) = happyShift action_95
action_26 (62) = happyShift action_96
action_26 (63) = happyShift action_97
action_26 (64) = happyShift action_98
action_26 (65) = happyShift action_99
action_26 (66) = happyShift action_100
action_26 (67) = happyShift action_101
action_26 (68) = happyShift action_102
action_26 (69) = happyShift action_103
action_26 (70) = happyShift action_104
action_26 (71) = happyShift action_105
action_26 (72) = happyShift action_106
action_26 (73) = happyShift action_107
action_26 (76) = happyShift action_122
action_26 (86) = happyShift action_108
action_26 (31) = happyGoto action_86
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (75) = happyShift action_59
action_27 (77) = happyShift action_40
action_27 (79) = happyShift action_60
action_27 (83) = happyShift action_61
action_27 (85) = happyShift action_62
action_27 (91) = happyShift action_63
action_27 (23) = happyGoto action_57
action_27 (27) = happyGoto action_58
action_27 _ = happyReduce_59

action_28 _ = happyReduce_64

action_29 _ = happyReduce_58

action_30 _ = happyReduce_60

action_31 (39) = happyShift action_32
action_31 (41) = happyShift action_33
action_31 (46) = happyShift action_34
action_31 (47) = happyShift action_35
action_31 (52) = happyShift action_36
action_31 (56) = happyShift action_37
action_31 (61) = happyShift action_38
action_31 (63) = happyShift action_39
action_31 (75) = happyShift action_19
action_31 (77) = happyShift action_40
action_31 (87) = happyShift action_41
action_31 (88) = happyShift action_42
action_31 (89) = happyShift action_43
action_31 (90) = happyShift action_22
action_31 (91) = happyShift action_44
action_31 (17) = happyGoto action_25
action_31 (20) = happyGoto action_121
action_31 (21) = happyGoto action_27
action_31 (22) = happyGoto action_28
action_31 (24) = happyGoto action_29
action_31 (27) = happyGoto action_30
action_31 (32) = happyGoto action_31
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_52

action_33 (75) = happyShift action_85
action_33 (25) = happyGoto action_120
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_51

action_35 _ = happyReduce_106

action_36 _ = happyReduce_53

action_37 _ = happyReduce_105

action_38 _ = happyReduce_107

action_39 _ = happyReduce_108

action_40 (39) = happyShift action_32
action_40 (41) = happyShift action_33
action_40 (46) = happyShift action_34
action_40 (47) = happyShift action_35
action_40 (52) = happyShift action_36
action_40 (56) = happyShift action_37
action_40 (61) = happyShift action_38
action_40 (63) = happyShift action_39
action_40 (75) = happyShift action_19
action_40 (77) = happyShift action_40
action_40 (79) = happyShift action_118
action_40 (87) = happyShift action_41
action_40 (88) = happyShift action_42
action_40 (89) = happyShift action_43
action_40 (90) = happyShift action_119
action_40 (91) = happyShift action_44
action_40 (17) = happyGoto action_25
action_40 (20) = happyGoto action_115
action_40 (21) = happyGoto action_27
action_40 (22) = happyGoto action_28
action_40 (24) = happyGoto action_29
action_40 (27) = happyGoto action_30
action_40 (28) = happyGoto action_116
action_40 (29) = happyGoto action_117
action_40 (32) = happyGoto action_31
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_57

action_42 _ = happyReduce_55

action_43 _ = happyReduce_54

action_44 _ = happyReduce_56

action_45 (33) = happyShift action_87
action_45 (35) = happyShift action_114
action_45 (48) = happyShift action_88
action_45 (55) = happyShift action_90
action_45 (56) = happyShift action_91
action_45 (57) = happyShift action_92
action_45 (58) = happyShift action_93
action_45 (59) = happyShift action_94
action_45 (60) = happyShift action_95
action_45 (62) = happyShift action_96
action_45 (63) = happyShift action_97
action_45 (64) = happyShift action_98
action_45 (65) = happyShift action_99
action_45 (66) = happyShift action_100
action_45 (67) = happyShift action_101
action_45 (68) = happyShift action_102
action_45 (69) = happyShift action_103
action_45 (70) = happyShift action_104
action_45 (71) = happyShift action_105
action_45 (72) = happyShift action_106
action_45 (73) = happyShift action_107
action_45 (86) = happyShift action_108
action_45 (31) = happyGoto action_86
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (53) = happyShift action_113
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (74) = happyShift action_112
action_47 _ = happyReduce_23

action_48 (90) = happyShift action_111
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (72) = happyShift action_110
action_49 (11) = happyGoto action_109
action_49 _ = happyReduce_31

action_50 (33) = happyShift action_87
action_50 (48) = happyShift action_88
action_50 (51) = happyShift action_89
action_50 (55) = happyShift action_90
action_50 (56) = happyShift action_91
action_50 (57) = happyShift action_92
action_50 (58) = happyShift action_93
action_50 (59) = happyShift action_94
action_50 (60) = happyShift action_95
action_50 (62) = happyShift action_96
action_50 (63) = happyShift action_97
action_50 (64) = happyShift action_98
action_50 (65) = happyShift action_99
action_50 (66) = happyShift action_100
action_50 (67) = happyShift action_101
action_50 (68) = happyShift action_102
action_50 (69) = happyShift action_103
action_50 (70) = happyShift action_104
action_50 (71) = happyShift action_105
action_50 (72) = happyShift action_106
action_50 (73) = happyShift action_107
action_50 (86) = happyShift action_108
action_50 (31) = happyGoto action_86
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_12

action_52 (75) = happyShift action_85
action_52 (25) = happyGoto action_84
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (85) = happyShift action_83
action_53 (15) = happyGoto action_82
action_53 _ = happyReduce_37

action_54 (44) = happyShift action_81
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (74) = happyShift action_79
action_55 (84) = happyShift action_80
action_55 _ = happyReduce_47

action_56 (38) = happyShift action_78
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_66

action_58 _ = happyReduce_69

action_59 (39) = happyShift action_32
action_59 (41) = happyShift action_33
action_59 (46) = happyShift action_34
action_59 (47) = happyShift action_35
action_59 (52) = happyShift action_36
action_59 (56) = happyShift action_37
action_59 (61) = happyShift action_38
action_59 (63) = happyShift action_39
action_59 (75) = happyShift action_19
action_59 (77) = happyShift action_40
action_59 (87) = happyShift action_41
action_59 (88) = happyShift action_42
action_59 (89) = happyShift action_43
action_59 (90) = happyShift action_22
action_59 (91) = happyShift action_44
action_59 (17) = happyGoto action_25
action_59 (19) = happyGoto action_77
action_59 (20) = happyGoto action_70
action_59 (21) = happyGoto action_27
action_59 (22) = happyGoto action_28
action_59 (24) = happyGoto action_29
action_59 (27) = happyGoto action_30
action_59 (32) = happyGoto action_31
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (39) = happyShift action_32
action_60 (41) = happyShift action_33
action_60 (46) = happyShift action_34
action_60 (47) = happyShift action_35
action_60 (52) = happyShift action_36
action_60 (56) = happyShift action_37
action_60 (61) = happyShift action_38
action_60 (63) = happyShift action_39
action_60 (75) = happyShift action_19
action_60 (77) = happyShift action_40
action_60 (87) = happyShift action_41
action_60 (88) = happyShift action_42
action_60 (89) = happyShift action_43
action_60 (90) = happyShift action_22
action_60 (91) = happyShift action_44
action_60 (17) = happyGoto action_25
action_60 (20) = happyGoto action_76
action_60 (21) = happyGoto action_27
action_60 (22) = happyGoto action_28
action_60 (24) = happyGoto action_29
action_60 (27) = happyGoto action_30
action_60 (32) = happyGoto action_31
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (90) = happyShift action_75
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (90) = happyShift action_74
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_70

action_64 (75) = happyShift action_19
action_64 (90) = happyShift action_22
action_64 (16) = happyGoto action_73
action_64 (17) = happyGoto action_7
action_64 (21) = happyGoto action_8
action_64 (22) = happyGoto action_28
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyShift action_32
action_65 (41) = happyShift action_33
action_65 (46) = happyShift action_34
action_65 (47) = happyShift action_35
action_65 (52) = happyShift action_36
action_65 (56) = happyShift action_37
action_65 (61) = happyShift action_38
action_65 (63) = happyShift action_39
action_65 (75) = happyShift action_19
action_65 (77) = happyShift action_40
action_65 (87) = happyShift action_41
action_65 (88) = happyShift action_42
action_65 (89) = happyShift action_43
action_65 (90) = happyShift action_22
action_65 (91) = happyShift action_44
action_65 (17) = happyGoto action_25
action_65 (19) = happyGoto action_72
action_65 (20) = happyGoto action_70
action_65 (21) = happyGoto action_27
action_65 (22) = happyGoto action_28
action_65 (24) = happyGoto action_29
action_65 (27) = happyGoto action_30
action_65 (32) = happyGoto action_31
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_6

action_67 _ = happyReduce_2

action_68 (39) = happyShift action_32
action_68 (41) = happyShift action_33
action_68 (46) = happyShift action_34
action_68 (47) = happyShift action_35
action_68 (52) = happyShift action_36
action_68 (56) = happyShift action_37
action_68 (61) = happyShift action_38
action_68 (63) = happyShift action_39
action_68 (75) = happyShift action_19
action_68 (77) = happyShift action_40
action_68 (82) = happyShift action_71
action_68 (87) = happyShift action_41
action_68 (88) = happyShift action_42
action_68 (89) = happyShift action_43
action_68 (90) = happyShift action_22
action_68 (91) = happyShift action_44
action_68 (17) = happyGoto action_25
action_68 (19) = happyGoto action_69
action_68 (20) = happyGoto action_70
action_68 (21) = happyGoto action_27
action_68 (22) = happyGoto action_28
action_68 (24) = happyGoto action_29
action_68 (27) = happyGoto action_30
action_68 (32) = happyGoto action_31
action_68 _ = happyReduce_35

action_69 (82) = happyShift action_152
action_69 _ = happyReduce_33

action_70 (33) = happyShift action_87
action_70 (48) = happyShift action_88
action_70 (55) = happyShift action_90
action_70 (56) = happyShift action_91
action_70 (57) = happyShift action_92
action_70 (58) = happyShift action_93
action_70 (59) = happyShift action_94
action_70 (60) = happyShift action_95
action_70 (62) = happyShift action_96
action_70 (63) = happyShift action_97
action_70 (64) = happyShift action_98
action_70 (65) = happyShift action_99
action_70 (66) = happyShift action_100
action_70 (67) = happyShift action_101
action_70 (68) = happyShift action_102
action_70 (69) = happyShift action_103
action_70 (70) = happyShift action_104
action_70 (71) = happyShift action_105
action_70 (72) = happyShift action_106
action_70 (73) = happyShift action_107
action_70 (84) = happyShift action_151
action_70 (86) = happyShift action_108
action_70 (31) = happyGoto action_86
action_70 _ = happyReduce_49

action_71 _ = happyReduce_34

action_72 _ = happyReduce_8

action_73 _ = happyReduce_43

action_74 _ = happyReduce_46

action_75 (75) = happyShift action_59
action_75 (77) = happyShift action_40
action_75 (91) = happyShift action_63
action_75 (23) = happyGoto action_150
action_75 (27) = happyGoto action_58
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (33) = happyShift action_87
action_76 (48) = happyShift action_88
action_76 (55) = happyShift action_90
action_76 (56) = happyShift action_91
action_76 (57) = happyShift action_92
action_76 (58) = happyShift action_93
action_76 (59) = happyShift action_94
action_76 (60) = happyShift action_95
action_76 (62) = happyShift action_96
action_76 (63) = happyShift action_97
action_76 (64) = happyShift action_98
action_76 (65) = happyShift action_99
action_76 (66) = happyShift action_100
action_76 (67) = happyShift action_101
action_76 (68) = happyShift action_102
action_76 (69) = happyShift action_103
action_76 (70) = happyShift action_104
action_76 (71) = happyShift action_105
action_76 (72) = happyShift action_106
action_76 (73) = happyShift action_107
action_76 (80) = happyShift action_149
action_76 (86) = happyShift action_108
action_76 (31) = happyGoto action_86
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (76) = happyShift action_148
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_13

action_79 (39) = happyShift action_32
action_79 (41) = happyShift action_33
action_79 (46) = happyShift action_34
action_79 (47) = happyShift action_35
action_79 (52) = happyShift action_36
action_79 (56) = happyShift action_37
action_79 (61) = happyShift action_38
action_79 (63) = happyShift action_39
action_79 (75) = happyShift action_19
action_79 (77) = happyShift action_40
action_79 (87) = happyShift action_41
action_79 (88) = happyShift action_42
action_79 (89) = happyShift action_43
action_79 (90) = happyShift action_22
action_79 (91) = happyShift action_44
action_79 (17) = happyGoto action_25
action_79 (20) = happyGoto action_147
action_79 (21) = happyGoto action_27
action_79 (22) = happyGoto action_28
action_79 (24) = happyGoto action_29
action_79 (27) = happyGoto action_30
action_79 (32) = happyGoto action_31
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (90) = happyShift action_141
action_80 (18) = happyGoto action_146
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (39) = happyShift action_32
action_81 (41) = happyShift action_33
action_81 (46) = happyShift action_34
action_81 (47) = happyShift action_35
action_81 (52) = happyShift action_36
action_81 (56) = happyShift action_37
action_81 (61) = happyShift action_38
action_81 (63) = happyShift action_39
action_81 (75) = happyShift action_19
action_81 (77) = happyShift action_40
action_81 (87) = happyShift action_41
action_81 (88) = happyShift action_42
action_81 (89) = happyShift action_43
action_81 (90) = happyShift action_22
action_81 (91) = happyShift action_44
action_81 (17) = happyGoto action_25
action_81 (19) = happyGoto action_145
action_81 (20) = happyGoto action_70
action_81 (21) = happyGoto action_27
action_81 (22) = happyGoto action_28
action_81 (24) = happyGoto action_29
action_81 (27) = happyGoto action_30
action_81 (32) = happyGoto action_31
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (83) = happyShift action_143
action_82 (85) = happyShift action_144
action_82 _ = happyReduce_39

action_83 (90) = happyShift action_142
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_20

action_85 (87) = happyShift action_140
action_85 (90) = happyShift action_141
action_85 (18) = happyGoto action_138
action_85 (26) = happyGoto action_139
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (39) = happyShift action_32
action_86 (41) = happyShift action_33
action_86 (46) = happyShift action_34
action_86 (47) = happyShift action_35
action_86 (52) = happyShift action_36
action_86 (56) = happyShift action_37
action_86 (61) = happyShift action_38
action_86 (63) = happyShift action_39
action_86 (75) = happyShift action_19
action_86 (77) = happyShift action_40
action_86 (87) = happyShift action_41
action_86 (88) = happyShift action_42
action_86 (89) = happyShift action_43
action_86 (90) = happyShift action_22
action_86 (91) = happyShift action_44
action_86 (17) = happyGoto action_25
action_86 (20) = happyGoto action_137
action_86 (21) = happyGoto action_27
action_86 (22) = happyGoto action_28
action_86 (24) = happyGoto action_29
action_86 (27) = happyGoto action_30
action_86 (32) = happyGoto action_31
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_103

action_88 _ = happyReduce_104

action_89 (34) = happyShift action_10
action_89 (35) = happyShift action_11
action_89 (40) = happyShift action_12
action_89 (41) = happyShift action_13
action_89 (42) = happyShift action_14
action_89 (43) = happyShift action_15
action_89 (45) = happyShift action_16
action_89 (49) = happyShift action_17
action_89 (54) = happyShift action_18
action_89 (75) = happyShift action_19
action_89 (81) = happyShift action_20
action_89 (82) = happyShift action_21
action_89 (90) = happyShift action_22
action_89 (5) = happyGoto action_136
action_89 (6) = happyGoto action_3
action_89 (7) = happyGoto action_4
action_89 (13) = happyGoto action_5
action_89 (16) = happyGoto action_6
action_89 (17) = happyGoto action_7
action_89 (21) = happyGoto action_8
action_89 (22) = happyGoto action_9
action_89 _ = happyReduce_4

action_90 _ = happyReduce_84

action_91 _ = happyReduce_85

action_92 _ = happyReduce_86

action_93 _ = happyReduce_87

action_94 _ = happyReduce_90

action_95 _ = happyReduce_89

action_96 _ = happyReduce_91

action_97 _ = happyReduce_92

action_98 _ = happyReduce_93

action_99 _ = happyReduce_95

action_100 _ = happyReduce_94

action_101 _ = happyReduce_88

action_102 _ = happyReduce_101

action_103 _ = happyReduce_102

action_104 _ = happyReduce_98

action_105 _ = happyReduce_100

action_106 _ = happyReduce_97

action_107 _ = happyReduce_99

action_108 _ = happyReduce_96

action_109 (84) = happyShift action_135
action_109 _ = happyReduce_28

action_110 (90) = happyShift action_134
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (75) = happyShift action_85
action_111 (25) = happyGoto action_133
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (39) = happyShift action_32
action_112 (41) = happyShift action_33
action_112 (46) = happyShift action_34
action_112 (47) = happyShift action_35
action_112 (52) = happyShift action_36
action_112 (56) = happyShift action_37
action_112 (61) = happyShift action_38
action_112 (63) = happyShift action_39
action_112 (75) = happyShift action_19
action_112 (77) = happyShift action_40
action_112 (87) = happyShift action_41
action_112 (88) = happyShift action_42
action_112 (89) = happyShift action_43
action_112 (90) = happyShift action_22
action_112 (91) = happyShift action_44
action_112 (17) = happyGoto action_25
action_112 (19) = happyGoto action_132
action_112 (20) = happyGoto action_70
action_112 (21) = happyGoto action_27
action_112 (22) = happyGoto action_28
action_112 (24) = happyGoto action_29
action_112 (27) = happyGoto action_30
action_112 (32) = happyGoto action_31
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (39) = happyShift action_32
action_113 (41) = happyShift action_33
action_113 (46) = happyShift action_34
action_113 (47) = happyShift action_35
action_113 (52) = happyShift action_36
action_113 (56) = happyShift action_37
action_113 (61) = happyShift action_38
action_113 (63) = happyShift action_39
action_113 (75) = happyShift action_19
action_113 (77) = happyShift action_40
action_113 (87) = happyShift action_41
action_113 (88) = happyShift action_42
action_113 (89) = happyShift action_43
action_113 (90) = happyShift action_22
action_113 (91) = happyShift action_44
action_113 (17) = happyGoto action_25
action_113 (20) = happyGoto action_131
action_113 (21) = happyGoto action_27
action_113 (22) = happyGoto action_28
action_113 (24) = happyGoto action_29
action_113 (27) = happyGoto action_30
action_113 (32) = happyGoto action_31
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (34) = happyShift action_10
action_114 (35) = happyShift action_11
action_114 (40) = happyShift action_12
action_114 (41) = happyShift action_13
action_114 (42) = happyShift action_14
action_114 (43) = happyShift action_15
action_114 (45) = happyShift action_16
action_114 (49) = happyShift action_17
action_114 (54) = happyShift action_18
action_114 (75) = happyShift action_19
action_114 (81) = happyShift action_20
action_114 (82) = happyShift action_21
action_114 (90) = happyShift action_22
action_114 (5) = happyGoto action_130
action_114 (6) = happyGoto action_3
action_114 (7) = happyGoto action_4
action_114 (13) = happyGoto action_5
action_114 (16) = happyGoto action_6
action_114 (17) = happyGoto action_7
action_114 (21) = happyGoto action_8
action_114 (22) = happyGoto action_9
action_114 _ = happyReduce_4

action_115 (33) = happyShift action_87
action_115 (48) = happyShift action_88
action_115 (55) = happyShift action_90
action_115 (56) = happyShift action_91
action_115 (57) = happyShift action_92
action_115 (58) = happyShift action_93
action_115 (59) = happyShift action_94
action_115 (60) = happyShift action_95
action_115 (62) = happyShift action_96
action_115 (63) = happyShift action_97
action_115 (64) = happyShift action_98
action_115 (65) = happyShift action_99
action_115 (66) = happyShift action_100
action_115 (67) = happyShift action_101
action_115 (68) = happyShift action_102
action_115 (69) = happyShift action_103
action_115 (70) = happyShift action_104
action_115 (71) = happyShift action_105
action_115 (72) = happyShift action_106
action_115 (73) = happyShift action_107
action_115 (86) = happyShift action_108
action_115 (31) = happyGoto action_86
action_115 _ = happyReduce_81

action_116 (78) = happyShift action_129
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (82) = happyShift action_127
action_117 (84) = happyShift action_128
action_117 (30) = happyGoto action_126
action_117 _ = happyReduce_76

action_118 (39) = happyShift action_32
action_118 (41) = happyShift action_33
action_118 (46) = happyShift action_34
action_118 (47) = happyShift action_35
action_118 (52) = happyShift action_36
action_118 (56) = happyShift action_37
action_118 (61) = happyShift action_38
action_118 (63) = happyShift action_39
action_118 (75) = happyShift action_19
action_118 (77) = happyShift action_40
action_118 (87) = happyShift action_41
action_118 (88) = happyShift action_42
action_118 (89) = happyShift action_43
action_118 (90) = happyShift action_22
action_118 (91) = happyShift action_44
action_118 (17) = happyGoto action_25
action_118 (20) = happyGoto action_125
action_118 (21) = happyGoto action_27
action_118 (22) = happyGoto action_28
action_118 (24) = happyGoto action_29
action_118 (27) = happyGoto action_30
action_118 (32) = happyGoto action_31
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (74) = happyShift action_124
action_119 _ = happyReduce_44

action_120 _ = happyReduce_71

action_121 (33) = happyShift action_87
action_121 (48) = happyShift action_88
action_121 (55) = happyShift action_90
action_121 (56) = happyShift action_91
action_121 (57) = happyShift action_92
action_121 (58) = happyShift action_93
action_121 (59) = happyShift action_94
action_121 (60) = happyShift action_95
action_121 (62) = happyShift action_96
action_121 (63) = happyShift action_97
action_121 (64) = happyShift action_98
action_121 (65) = happyShift action_99
action_121 (66) = happyShift action_100
action_121 (67) = happyShift action_101
action_121 (68) = happyShift action_102
action_121 (69) = happyShift action_103
action_121 (70) = happyShift action_104
action_121 (71) = happyShift action_105
action_121 (72) = happyShift action_106
action_121 (73) = happyShift action_107
action_121 (86) = happyShift action_108
action_121 (31) = happyGoto action_86
action_121 _ = happyReduce_62

action_122 _ = happyReduce_65

action_123 _ = happyReduce_36

action_124 (39) = happyShift action_32
action_124 (41) = happyShift action_33
action_124 (46) = happyShift action_34
action_124 (47) = happyShift action_35
action_124 (52) = happyShift action_36
action_124 (56) = happyShift action_37
action_124 (61) = happyShift action_38
action_124 (63) = happyShift action_39
action_124 (75) = happyShift action_19
action_124 (77) = happyShift action_40
action_124 (87) = happyShift action_41
action_124 (88) = happyShift action_42
action_124 (89) = happyShift action_43
action_124 (90) = happyShift action_22
action_124 (91) = happyShift action_44
action_124 (17) = happyGoto action_25
action_124 (20) = happyGoto action_167
action_124 (21) = happyGoto action_27
action_124 (22) = happyGoto action_28
action_124 (24) = happyGoto action_29
action_124 (27) = happyGoto action_30
action_124 (32) = happyGoto action_31
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (33) = happyShift action_87
action_125 (48) = happyShift action_88
action_125 (55) = happyShift action_90
action_125 (56) = happyShift action_91
action_125 (57) = happyShift action_92
action_125 (58) = happyShift action_93
action_125 (59) = happyShift action_94
action_125 (60) = happyShift action_95
action_125 (62) = happyShift action_96
action_125 (63) = happyShift action_97
action_125 (64) = happyShift action_98
action_125 (65) = happyShift action_99
action_125 (66) = happyShift action_100
action_125 (67) = happyShift action_101
action_125 (68) = happyShift action_102
action_125 (69) = happyShift action_103
action_125 (70) = happyShift action_104
action_125 (71) = happyShift action_105
action_125 (72) = happyShift action_106
action_125 (73) = happyShift action_107
action_125 (80) = happyShift action_166
action_125 (86) = happyShift action_108
action_125 (31) = happyGoto action_86
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (39) = happyShift action_32
action_126 (41) = happyShift action_33
action_126 (46) = happyShift action_34
action_126 (47) = happyShift action_35
action_126 (52) = happyShift action_36
action_126 (56) = happyShift action_37
action_126 (61) = happyShift action_38
action_126 (63) = happyShift action_39
action_126 (75) = happyShift action_19
action_126 (77) = happyShift action_40
action_126 (79) = happyShift action_118
action_126 (87) = happyShift action_41
action_126 (88) = happyShift action_42
action_126 (89) = happyShift action_43
action_126 (90) = happyShift action_119
action_126 (91) = happyShift action_44
action_126 (17) = happyGoto action_25
action_126 (20) = happyGoto action_115
action_126 (21) = happyGoto action_27
action_126 (22) = happyGoto action_28
action_126 (24) = happyGoto action_29
action_126 (27) = happyGoto action_30
action_126 (28) = happyGoto action_165
action_126 (29) = happyGoto action_117
action_126 (32) = happyGoto action_31
action_126 _ = happyReduce_78

action_127 _ = happyReduce_83

action_128 _ = happyReduce_82

action_129 _ = happyReduce_75

action_130 (38) = happyShift action_164
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (33) = happyShift action_87
action_131 (48) = happyShift action_88
action_131 (55) = happyShift action_90
action_131 (56) = happyShift action_91
action_131 (57) = happyShift action_92
action_131 (58) = happyShift action_93
action_131 (59) = happyShift action_94
action_131 (60) = happyShift action_95
action_131 (62) = happyShift action_96
action_131 (63) = happyShift action_97
action_131 (64) = happyShift action_98
action_131 (65) = happyShift action_99
action_131 (66) = happyShift action_100
action_131 (67) = happyShift action_101
action_131 (68) = happyShift action_102
action_131 (69) = happyShift action_103
action_131 (70) = happyShift action_104
action_131 (71) = happyShift action_105
action_131 (72) = happyShift action_106
action_131 (73) = happyShift action_107
action_131 (86) = happyShift action_108
action_131 (31) = happyGoto action_86
action_131 _ = happyReduce_15

action_132 _ = happyReduce_22

action_133 _ = happyReduce_21

action_134 (73) = happyShift action_163
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (90) = happyShift action_49
action_135 (10) = happyGoto action_162
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (37) = happyShift action_161
action_136 (8) = happyGoto action_160
action_136 _ = happyReduce_24

action_137 (33) = happyShift action_87
action_137 (48) = happyShift action_88
action_137 (55) = happyShift action_90
action_137 (56) = happyShift action_91
action_137 (57) = happyShift action_92
action_137 (58) = happyShift action_93
action_137 (59) = happyShift action_94
action_137 (60) = happyShift action_95
action_137 (62) = happyShift action_96
action_137 (63) = happyShift action_97
action_137 (64) = happyShift action_98
action_137 (65) = happyShift action_99
action_137 (66) = happyShift action_100
action_137 (67) = happyShift action_101
action_137 (68) = happyShift action_102
action_137 (69) = happyShift action_103
action_137 (70) = happyShift action_104
action_137 (71) = happyShift action_105
action_137 (72) = happyShift action_106
action_137 (73) = happyShift action_107
action_137 (86) = happyShift action_108
action_137 (31) = happyGoto action_86
action_137 _ = happyReduce_61

action_138 (84) = happyShift action_159
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (76) = happyShift action_158
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_74

action_141 (84) = happyShift action_80
action_141 _ = happyReduce_47

action_142 _ = happyReduce_40

action_143 (90) = happyShift action_157
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (90) = happyShift action_156
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (35) = happyShift action_155
action_145 _ = happyFail (happyExpListPerState 145)

action_146 _ = happyReduce_48

action_147 (33) = happyShift action_87
action_147 (48) = happyShift action_88
action_147 (55) = happyShift action_90
action_147 (56) = happyShift action_91
action_147 (57) = happyShift action_92
action_147 (58) = happyShift action_93
action_147 (59) = happyShift action_94
action_147 (60) = happyShift action_95
action_147 (62) = happyShift action_96
action_147 (63) = happyShift action_97
action_147 (64) = happyShift action_98
action_147 (65) = happyShift action_99
action_147 (66) = happyShift action_100
action_147 (67) = happyShift action_101
action_147 (68) = happyShift action_102
action_147 (69) = happyShift action_103
action_147 (70) = happyShift action_104
action_147 (71) = happyShift action_105
action_147 (72) = happyShift action_106
action_147 (73) = happyShift action_107
action_147 (84) = happyShift action_154
action_147 (86) = happyShift action_108
action_147 (31) = happyGoto action_86
action_147 _ = happyFail (happyExpListPerState 147)

action_148 _ = happyReduce_68

action_149 _ = happyReduce_45

action_150 _ = happyReduce_67

action_151 (39) = happyShift action_32
action_151 (41) = happyShift action_33
action_151 (46) = happyShift action_34
action_151 (47) = happyShift action_35
action_151 (52) = happyShift action_36
action_151 (56) = happyShift action_37
action_151 (61) = happyShift action_38
action_151 (63) = happyShift action_39
action_151 (75) = happyShift action_19
action_151 (77) = happyShift action_40
action_151 (87) = happyShift action_41
action_151 (88) = happyShift action_42
action_151 (89) = happyShift action_43
action_151 (90) = happyShift action_22
action_151 (91) = happyShift action_44
action_151 (17) = happyGoto action_25
action_151 (19) = happyGoto action_153
action_151 (20) = happyGoto action_70
action_151 (21) = happyGoto action_27
action_151 (22) = happyGoto action_28
action_151 (24) = happyGoto action_29
action_151 (27) = happyGoto action_30
action_151 (32) = happyGoto action_31
action_151 _ = happyFail (happyExpListPerState 151)

action_152 _ = happyReduce_32

action_153 _ = happyReduce_50

action_154 (39) = happyShift action_32
action_154 (41) = happyShift action_33
action_154 (46) = happyShift action_34
action_154 (47) = happyShift action_35
action_154 (52) = happyShift action_36
action_154 (56) = happyShift action_37
action_154 (61) = happyShift action_38
action_154 (63) = happyShift action_39
action_154 (75) = happyShift action_19
action_154 (77) = happyShift action_40
action_154 (87) = happyShift action_41
action_154 (88) = happyShift action_42
action_154 (89) = happyShift action_43
action_154 (90) = happyShift action_22
action_154 (91) = happyShift action_44
action_154 (17) = happyGoto action_25
action_154 (20) = happyGoto action_175
action_154 (21) = happyGoto action_27
action_154 (22) = happyGoto action_28
action_154 (24) = happyGoto action_29
action_154 (27) = happyGoto action_30
action_154 (32) = happyGoto action_31
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (34) = happyShift action_10
action_155 (35) = happyShift action_11
action_155 (40) = happyShift action_12
action_155 (41) = happyShift action_13
action_155 (42) = happyShift action_14
action_155 (43) = happyShift action_15
action_155 (45) = happyShift action_16
action_155 (49) = happyShift action_17
action_155 (54) = happyShift action_18
action_155 (75) = happyShift action_19
action_155 (81) = happyShift action_20
action_155 (82) = happyShift action_21
action_155 (90) = happyShift action_22
action_155 (5) = happyGoto action_174
action_155 (6) = happyGoto action_3
action_155 (7) = happyGoto action_4
action_155 (13) = happyGoto action_5
action_155 (16) = happyGoto action_6
action_155 (17) = happyGoto action_7
action_155 (21) = happyGoto action_8
action_155 (22) = happyGoto action_9
action_155 _ = happyReduce_4

action_156 _ = happyReduce_41

action_157 _ = happyReduce_38

action_158 (34) = happyShift action_10
action_158 (35) = happyShift action_11
action_158 (40) = happyShift action_12
action_158 (41) = happyShift action_13
action_158 (42) = happyShift action_14
action_158 (43) = happyShift action_15
action_158 (45) = happyShift action_16
action_158 (49) = happyShift action_17
action_158 (54) = happyShift action_18
action_158 (75) = happyShift action_19
action_158 (81) = happyShift action_20
action_158 (82) = happyShift action_21
action_158 (90) = happyShift action_22
action_158 (5) = happyGoto action_173
action_158 (6) = happyGoto action_3
action_158 (7) = happyGoto action_4
action_158 (13) = happyGoto action_5
action_158 (16) = happyGoto action_6
action_158 (17) = happyGoto action_7
action_158 (21) = happyGoto action_8
action_158 (22) = happyGoto action_9
action_158 _ = happyReduce_4

action_159 (87) = happyShift action_172
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (36) = happyShift action_171
action_160 (9) = happyGoto action_170
action_160 _ = happyReduce_26

action_161 (39) = happyShift action_32
action_161 (41) = happyShift action_33
action_161 (46) = happyShift action_34
action_161 (47) = happyShift action_35
action_161 (52) = happyShift action_36
action_161 (56) = happyShift action_37
action_161 (61) = happyShift action_38
action_161 (63) = happyShift action_39
action_161 (75) = happyShift action_19
action_161 (77) = happyShift action_40
action_161 (87) = happyShift action_41
action_161 (88) = happyShift action_42
action_161 (89) = happyShift action_43
action_161 (90) = happyShift action_22
action_161 (91) = happyShift action_44
action_161 (17) = happyGoto action_25
action_161 (20) = happyGoto action_169
action_161 (21) = happyGoto action_27
action_161 (22) = happyGoto action_28
action_161 (24) = happyGoto action_29
action_161 (27) = happyGoto action_30
action_161 (32) = happyGoto action_31
action_161 _ = happyFail (happyExpListPerState 161)

action_162 _ = happyReduce_29

action_163 _ = happyReduce_30

action_164 _ = happyReduce_14

action_165 _ = happyReduce_77

action_166 (74) = happyShift action_168
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (33) = happyShift action_87
action_167 (48) = happyShift action_88
action_167 (55) = happyShift action_90
action_167 (56) = happyShift action_91
action_167 (57) = happyShift action_92
action_167 (58) = happyShift action_93
action_167 (59) = happyShift action_94
action_167 (60) = happyShift action_95
action_167 (62) = happyShift action_96
action_167 (63) = happyShift action_97
action_167 (64) = happyShift action_98
action_167 (65) = happyShift action_99
action_167 (66) = happyShift action_100
action_167 (67) = happyShift action_101
action_167 (68) = happyShift action_102
action_167 (69) = happyShift action_103
action_167 (70) = happyShift action_104
action_167 (71) = happyShift action_105
action_167 (72) = happyShift action_106
action_167 (73) = happyShift action_107
action_167 (86) = happyShift action_108
action_167 (31) = happyGoto action_86
action_167 _ = happyReduce_80

action_168 (39) = happyShift action_32
action_168 (41) = happyShift action_33
action_168 (46) = happyShift action_34
action_168 (47) = happyShift action_35
action_168 (52) = happyShift action_36
action_168 (56) = happyShift action_37
action_168 (61) = happyShift action_38
action_168 (63) = happyShift action_39
action_168 (75) = happyShift action_19
action_168 (77) = happyShift action_40
action_168 (87) = happyShift action_41
action_168 (88) = happyShift action_42
action_168 (89) = happyShift action_43
action_168 (90) = happyShift action_22
action_168 (91) = happyShift action_44
action_168 (17) = happyGoto action_25
action_168 (20) = happyGoto action_183
action_168 (21) = happyGoto action_27
action_168 (22) = happyGoto action_28
action_168 (24) = happyGoto action_29
action_168 (27) = happyGoto action_30
action_168 (32) = happyGoto action_31
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (33) = happyShift action_87
action_169 (48) = happyShift action_88
action_169 (51) = happyShift action_182
action_169 (55) = happyShift action_90
action_169 (56) = happyShift action_91
action_169 (57) = happyShift action_92
action_169 (58) = happyShift action_93
action_169 (59) = happyShift action_94
action_169 (60) = happyShift action_95
action_169 (62) = happyShift action_96
action_169 (63) = happyShift action_97
action_169 (64) = happyShift action_98
action_169 (65) = happyShift action_99
action_169 (66) = happyShift action_100
action_169 (67) = happyShift action_101
action_169 (68) = happyShift action_102
action_169 (69) = happyShift action_103
action_169 (70) = happyShift action_104
action_169 (71) = happyShift action_105
action_169 (72) = happyShift action_106
action_169 (73) = happyShift action_107
action_169 (86) = happyShift action_108
action_169 (31) = happyGoto action_86
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (38) = happyShift action_181
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (34) = happyShift action_10
action_171 (35) = happyShift action_11
action_171 (40) = happyShift action_12
action_171 (41) = happyShift action_13
action_171 (42) = happyShift action_14
action_171 (43) = happyShift action_15
action_171 (45) = happyShift action_16
action_171 (49) = happyShift action_17
action_171 (54) = happyShift action_18
action_171 (75) = happyShift action_19
action_171 (81) = happyShift action_20
action_171 (82) = happyShift action_21
action_171 (90) = happyShift action_22
action_171 (5) = happyGoto action_180
action_171 (6) = happyGoto action_3
action_171 (7) = happyGoto action_4
action_171 (13) = happyGoto action_5
action_171 (16) = happyGoto action_6
action_171 (17) = happyGoto action_7
action_171 (21) = happyGoto action_8
action_171 (22) = happyGoto action_9
action_171 _ = happyReduce_4

action_172 _ = happyReduce_73

action_173 (38) = happyShift action_179
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (38) = happyShift action_178
action_174 _ = happyFail (happyExpListPerState 174)

action_175 (33) = happyShift action_87
action_175 (35) = happyShift action_176
action_175 (48) = happyShift action_88
action_175 (55) = happyShift action_90
action_175 (56) = happyShift action_91
action_175 (57) = happyShift action_92
action_175 (58) = happyShift action_93
action_175 (59) = happyShift action_94
action_175 (60) = happyShift action_95
action_175 (62) = happyShift action_96
action_175 (63) = happyShift action_97
action_175 (64) = happyShift action_98
action_175 (65) = happyShift action_99
action_175 (66) = happyShift action_100
action_175 (67) = happyShift action_101
action_175 (68) = happyShift action_102
action_175 (69) = happyShift action_103
action_175 (70) = happyShift action_104
action_175 (71) = happyShift action_105
action_175 (72) = happyShift action_106
action_175 (73) = happyShift action_107
action_175 (84) = happyShift action_177
action_175 (86) = happyShift action_108
action_175 (31) = happyGoto action_86
action_175 _ = happyFail (happyExpListPerState 175)

action_176 (34) = happyShift action_10
action_176 (35) = happyShift action_11
action_176 (40) = happyShift action_12
action_176 (41) = happyShift action_13
action_176 (42) = happyShift action_14
action_176 (43) = happyShift action_15
action_176 (45) = happyShift action_16
action_176 (49) = happyShift action_17
action_176 (54) = happyShift action_18
action_176 (75) = happyShift action_19
action_176 (81) = happyShift action_20
action_176 (82) = happyShift action_21
action_176 (90) = happyShift action_22
action_176 (5) = happyGoto action_186
action_176 (6) = happyGoto action_3
action_176 (7) = happyGoto action_4
action_176 (13) = happyGoto action_5
action_176 (16) = happyGoto action_6
action_176 (17) = happyGoto action_7
action_176 (21) = happyGoto action_8
action_176 (22) = happyGoto action_9
action_176 _ = happyReduce_4

action_177 (39) = happyShift action_32
action_177 (41) = happyShift action_33
action_177 (46) = happyShift action_34
action_177 (47) = happyShift action_35
action_177 (52) = happyShift action_36
action_177 (56) = happyShift action_37
action_177 (61) = happyShift action_38
action_177 (63) = happyShift action_39
action_177 (75) = happyShift action_19
action_177 (77) = happyShift action_40
action_177 (87) = happyShift action_41
action_177 (88) = happyShift action_42
action_177 (89) = happyShift action_43
action_177 (90) = happyShift action_22
action_177 (91) = happyShift action_44
action_177 (17) = happyGoto action_25
action_177 (20) = happyGoto action_185
action_177 (21) = happyGoto action_27
action_177 (22) = happyGoto action_28
action_177 (24) = happyGoto action_29
action_177 (27) = happyGoto action_30
action_177 (32) = happyGoto action_31
action_177 _ = happyFail (happyExpListPerState 177)

action_178 _ = happyReduce_19

action_179 _ = happyReduce_72

action_180 _ = happyReduce_27

action_181 _ = happyReduce_16

action_182 (34) = happyShift action_10
action_182 (35) = happyShift action_11
action_182 (40) = happyShift action_12
action_182 (41) = happyShift action_13
action_182 (42) = happyShift action_14
action_182 (43) = happyShift action_15
action_182 (45) = happyShift action_16
action_182 (49) = happyShift action_17
action_182 (54) = happyShift action_18
action_182 (75) = happyShift action_19
action_182 (81) = happyShift action_20
action_182 (82) = happyShift action_21
action_182 (90) = happyShift action_22
action_182 (5) = happyGoto action_184
action_182 (6) = happyGoto action_3
action_182 (7) = happyGoto action_4
action_182 (13) = happyGoto action_5
action_182 (16) = happyGoto action_6
action_182 (17) = happyGoto action_7
action_182 (21) = happyGoto action_8
action_182 (22) = happyGoto action_9
action_182 _ = happyReduce_4

action_183 (33) = happyShift action_87
action_183 (48) = happyShift action_88
action_183 (55) = happyShift action_90
action_183 (56) = happyShift action_91
action_183 (57) = happyShift action_92
action_183 (58) = happyShift action_93
action_183 (59) = happyShift action_94
action_183 (60) = happyShift action_95
action_183 (62) = happyShift action_96
action_183 (63) = happyShift action_97
action_183 (64) = happyShift action_98
action_183 (65) = happyShift action_99
action_183 (66) = happyShift action_100
action_183 (67) = happyShift action_101
action_183 (68) = happyShift action_102
action_183 (69) = happyShift action_103
action_183 (70) = happyShift action_104
action_183 (71) = happyShift action_105
action_183 (72) = happyShift action_106
action_183 (73) = happyShift action_107
action_183 (86) = happyShift action_108
action_183 (31) = happyGoto action_86
action_183 _ = happyReduce_79

action_184 (37) = happyShift action_161
action_184 (8) = happyGoto action_189
action_184 _ = happyReduce_24

action_185 (33) = happyShift action_87
action_185 (35) = happyShift action_188
action_185 (48) = happyShift action_88
action_185 (55) = happyShift action_90
action_185 (56) = happyShift action_91
action_185 (57) = happyShift action_92
action_185 (58) = happyShift action_93
action_185 (59) = happyShift action_94
action_185 (60) = happyShift action_95
action_185 (62) = happyShift action_96
action_185 (63) = happyShift action_97
action_185 (64) = happyShift action_98
action_185 (65) = happyShift action_99
action_185 (66) = happyShift action_100
action_185 (67) = happyShift action_101
action_185 (68) = happyShift action_102
action_185 (69) = happyShift action_103
action_185 (70) = happyShift action_104
action_185 (71) = happyShift action_105
action_185 (72) = happyShift action_106
action_185 (73) = happyShift action_107
action_185 (86) = happyShift action_108
action_185 (31) = happyGoto action_86
action_185 _ = happyFail (happyExpListPerState 185)

action_186 (38) = happyShift action_187
action_186 _ = happyFail (happyExpListPerState 186)

action_187 _ = happyReduce_18

action_188 (34) = happyShift action_10
action_188 (35) = happyShift action_11
action_188 (40) = happyShift action_12
action_188 (41) = happyShift action_13
action_188 (42) = happyShift action_14
action_188 (43) = happyShift action_15
action_188 (45) = happyShift action_16
action_188 (49) = happyShift action_17
action_188 (54) = happyShift action_18
action_188 (75) = happyShift action_19
action_188 (81) = happyShift action_20
action_188 (82) = happyShift action_21
action_188 (90) = happyShift action_22
action_188 (5) = happyGoto action_190
action_188 (6) = happyGoto action_3
action_188 (7) = happyGoto action_4
action_188 (13) = happyGoto action_5
action_188 (16) = happyGoto action_6
action_188 (17) = happyGoto action_7
action_188 (21) = happyGoto action_8
action_188 (22) = happyGoto action_9
action_188 _ = happyReduce_4

action_189 _ = happyReduce_25

action_190 (38) = happyShift action_191
action_190 _ = happyFail (happyExpListPerState 190)

action_191 _ = happyReduce_17

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (ChunkBlock happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (BlockStatListRetstat happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (BlockStatList happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  5 happyReduction_4
happyReduction_4  =  HappyAbsSyn5
		 (BlockEmpty
	)

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (StatListSingle happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (StatListCons happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn7
		 (StatSemicolonEmpty
	)

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn7
		 (StatAssignment happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn7
		 (StatFunctionCall happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (StatLabel happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn7
		 (StatBreak
	)

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 (HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn7
		 (StatGoto happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatDo happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 5 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatWhile happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatRepeat happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 7 7 happyReduction_16
happyReduction_16 (_ `HappyStk`
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

happyReduce_17 = happyReduce 11 7 happyReduction_17
happyReduction_17 (_ `HappyStk`
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

happyReduce_18 = happyReduce 9 7 happyReduction_18
happyReduction_18 (_ `HappyStk`
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

happyReduce_19 = happyReduce 7 7 happyReduction_19
happyReduction_19 (_ `HappyStk`
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

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn25  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatFunction happy_var_2 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 7 happyReduction_21
happyReduction_21 ((HappyAbsSyn25  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatLocalFunction happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 7 happyReduction_22
happyReduction_22 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatLocalAttribNameList happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  7 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatLocalAttribNameListSimple happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  8 happyReduction_24
happyReduction_24  =  HappyAbsSyn8
		 (EmptyElseIfList
	)

happyReduce_25 = happyReduce 5 8 happyReduction_25
happyReduction_25 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ElseIfListAppend happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_0  9 happyReduction_26
happyReduction_26  =  HappyAbsSyn9
		 (EmptyElseBlock
	)

happyReduce_27 = happySpecReduce_2  9 happyReduction_27
happyReduction_27 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (ElseBlock happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  10 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_2)
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn10
		 (AttnamelistCons happy_var_1 happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 4 10 happyReduction_29
happyReduction_29 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (AttnamelistAppend happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 _
	(HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn11
		 (AttribName happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  11 happyReduction_31
happyReduction_31  =  HappyAbsSyn11
		 (AttribEmpty
	)

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (ReturnStat happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  12 happyReduction_33
happyReduction_33 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (ReturnStat happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  12 happyReduction_34
happyReduction_34 _
	_
	 =  HappyAbsSyn12
		 (ReturnStatEmpty
	)

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn12
		 (ReturnStatEmpty
	)

happyReduce_36 = happySpecReduce_3  13 happyReduction_36
happyReduction_36 _
	(HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn13
		 (LabelName happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn14
		 (FuncnameDot happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 4 14 happyReduction_38
happyReduction_38 ((HappyTerminal (TokenIdentifier happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (FuncnameColon happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_2  14 happyReduction_39
happyReduction_39 (HappyAbsSyn15  happy_var_2)
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn14
		 (FuncnameDotListOnly happy_var_1 happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  15 happyReduction_40
happyReduction_40 (HappyTerminal (TokenIdentifier happy_var_2))
	_
	 =  HappyAbsSyn15
		 (FuncnameDotSingle happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  15 happyReduction_41
happyReduction_41 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (FuncnameDotListAppend happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (VarListSingle happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  16 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (VarListCons happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn17
		 (VarName happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happyReduce 4 17 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (VarBracket happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_3  17 happyReduction_46
happyReduction_46 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (VarDot happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn18
		 (NameListSingle happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn18
		 (NameListCons happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  19 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (ExpListSingle happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  19 happyReduction_50
happyReduction_50 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (ExpListCons happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 (ExpNil
	)

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 (ExpFalse
	)

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn20
		 (ExpTrue
	)

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn20
		 (ExpFloat happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 (HappyTerminal (TokenInteger happy_var_1))
	 =  HappyAbsSyn20
		 (ExpInteger happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn20
		 (ExpString happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn20
		 (ExpVararg
	)

happyReduce_58 = happySpecReduce_1  20 happyReduction_58
happyReduction_58 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpFunctionDef happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  20 happyReduction_59
happyReduction_59 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpPrefix happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  20 happyReduction_60
happyReduction_60 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpTable happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpBinop happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  20 happyReduction_62
happyReduction_62 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpUnop happy_var_1 happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  21 happyReduction_63
happyReduction_63 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn21
		 (PrefixVar happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  21 happyReduction_64
happyReduction_64 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (PrefixFunctionCall happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  21 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (PrefixExp happy_var_2
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  22 happyReduction_66
happyReduction_66 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn22
		 (FunctionCall happy_var_1 happy_var_2
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happyReduce 4 22 happyReduction_67
happyReduction_67 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (FunctionCallMethod happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_68 = happySpecReduce_3  23 happyReduction_68
happyReduction_68 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (ArgsExpList happy_var_2
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  23 happyReduction_69
happyReduction_69 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn23
		 (ArgsTable happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  23 happyReduction_70
happyReduction_70 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn23
		 (ArgsString happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_2  24 happyReduction_71
happyReduction_71 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (FunctionDef happy_var_2
	)
happyReduction_71 _ _  = notHappyAtAll 

happyReduce_72 = happyReduce 5 25 happyReduction_72
happyReduction_72 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (Funcbody happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_73 = happySpecReduce_3  26 happyReduction_73
happyReduction_73 _
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn26
		 (ParlistVararg happy_var_1
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  26 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn26
		 (ParlistOnlyVararg
	)

happyReduce_75 = happySpecReduce_3  27 happyReduction_75
happyReduction_75 _
	(HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (TableConstructor happy_var_2
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  28 happyReduction_76
happyReduction_76 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListSingle happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  28 happyReduction_77
happyReduction_77 (HappyAbsSyn28  happy_var_3)
	(HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListCons happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_2  28 happyReduction_78
happyReduction_78 (HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (FieldListLast happy_var_1 happy_var_2
	)
happyReduction_78 _ _  = notHappyAtAll 

happyReduce_79 = happyReduce 5 29 happyReduction_79
happyReduction_79 ((HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (FieldExpKey happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_80 = happySpecReduce_3  29 happyReduction_80
happyReduction_80 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn29
		 (FieldNameKey happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  29 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn29
		 (FieldExp happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_1  30 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn30
		 (FieldsepComma
	)

happyReduce_83 = happySpecReduce_1  30 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn30
		 (FieldsepSemicolon
	)

happyReduce_84 = happySpecReduce_1  31 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn31
		 (Plus
	)

happyReduce_85 = happySpecReduce_1  31 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn31
		 (BinaryMinus
	)

happyReduce_86 = happySpecReduce_1  31 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn31
		 (Multiply
	)

happyReduce_87 = happySpecReduce_1  31 happyReduction_87
happyReduction_87 _
	 =  HappyAbsSyn31
		 (Divide
	)

happyReduce_88 = happySpecReduce_1  31 happyReduction_88
happyReduction_88 _
	 =  HappyAbsSyn31
		 (FloorDiv
	)

happyReduce_89 = happySpecReduce_1  31 happyReduction_89
happyReduction_89 _
	 =  HappyAbsSyn31
		 (Power
	)

happyReduce_90 = happySpecReduce_1  31 happyReduction_90
happyReduction_90 _
	 =  HappyAbsSyn31
		 (Mod
	)

happyReduce_91 = happySpecReduce_1  31 happyReduction_91
happyReduction_91 _
	 =  HappyAbsSyn31
		 (BitwiseAnd
	)

happyReduce_92 = happySpecReduce_1  31 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn31
		 (BitwiseNot
	)

happyReduce_93 = happySpecReduce_1  31 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn31
		 (BitwiseOr
	)

happyReduce_94 = happySpecReduce_1  31 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn31
		 (ShiftRight
	)

happyReduce_95 = happySpecReduce_1  31 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn31
		 (ShiftLeft
	)

happyReduce_96 = happySpecReduce_1  31 happyReduction_96
happyReduction_96 _
	 =  HappyAbsSyn31
		 (Concat
	)

happyReduce_97 = happySpecReduce_1  31 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn31
		 (LessThan
	)

happyReduce_98 = happySpecReduce_1  31 happyReduction_98
happyReduction_98 _
	 =  HappyAbsSyn31
		 (LessThanEqual
	)

happyReduce_99 = happySpecReduce_1  31 happyReduction_99
happyReduction_99 _
	 =  HappyAbsSyn31
		 (GreaterThan
	)

happyReduce_100 = happySpecReduce_1  31 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn31
		 (GreaterThanEqual
	)

happyReduce_101 = happySpecReduce_1  31 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn31
		 (Equals
	)

happyReduce_102 = happySpecReduce_1  31 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn31
		 (NotEquals
	)

happyReduce_103 = happySpecReduce_1  31 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn31
		 (And
	)

happyReduce_104 = happySpecReduce_1  31 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn31
		 (Or
	)

happyReduce_105 = happySpecReduce_1  32 happyReduction_105
happyReduction_105 _
	 =  HappyAbsSyn32
		 (UnaryMinus
	)

happyReduce_106 = happySpecReduce_1  32 happyReduction_106
happyReduction_106 _
	 =  HappyAbsSyn32
		 (Not
	)

happyReduce_107 = happySpecReduce_1  32 happyReduction_107
happyReduction_107 _
	 =  HappyAbsSyn32
		 (Length
	)

happyReduce_108 = happySpecReduce_1  32 happyReduction_108
happyReduction_108 _
	 =  HappyAbsSyn32
		 (BitwiseNot
	)

happyNewToken action sts stk [] =
	action 92 92 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenAnd -> cont 33;
	TokenBreak -> cont 34;
	TokenDo -> cont 35;
	TokenElse -> cont 36;
	TokenElseif -> cont 37;
	TokenEnd -> cont 38;
	TokenFalse -> cont 39;
	TokenFor -> cont 40;
	TokenFunction -> cont 41;
	TokenGoto -> cont 42;
	TokenIf -> cont 43;
	TokenIn -> cont 44;
	TokenLocal -> cont 45;
	TokenNil -> cont 46;
	TokenNot -> cont 47;
	TokenOr -> cont 48;
	TokenRepeat -> cont 49;
	TokenReturn -> cont 50;
	TokenThen -> cont 51;
	TokenTrue -> cont 52;
	TokenUntil -> cont 53;
	TokenWhile -> cont 54;
	TokenAdd -> cont 55;
	TokenMinus -> cont 56;
	TokenMutiply -> cont 57;
	TokenDevide -> cont 58;
	TokenModulus -> cont 59;
	TokenPower -> cont 60;
	TokenLength -> cont 61;
	TokenBitwiseAnd -> cont 62;
	TokenBitwiseNot -> cont 63;
	TokenBitwiseOr -> cont 64;
	TokenLeftShift -> cont 65;
	TokenRightShift -> cont 66;
	TokenFloorDivision -> cont 67;
	TokenEquals -> cont 68;
	TokenNotEquals -> cont 69;
	TokenLessThanEquals -> cont 70;
	TokenGreaterThanEquals -> cont 71;
	TokenLessThan -> cont 72;
	TokenGreaterThan -> cont 73;
	TokenAssign -> cont 74;
	TokenLeftParentheses -> cont 75;
	TokenRightParentheses -> cont 76;
	TokenLeftBrace -> cont 77;
	TokenRightBrace -> cont 78;
	TokenLeftBracket -> cont 79;
	TokenRightBracket -> cont 80;
	TokenDoubleColon -> cont 81;
	TokenSemicolon -> cont 82;
	TokenColon -> cont 83;
	TokenComma -> cont 84;
	TokenDot -> cont 85;
	TokenConcat -> cont 86;
	TokenVararg -> cont 87;
	TokenInteger happy_dollar_dollar -> cont 88;
	TokenFloat happy_dollar_dollar -> cont 89;
	TokenIdentifier happy_dollar_dollar -> cont 90;
	TokenString happy_dollar_dollar -> cont 91;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 92 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































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
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
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
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

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
