import Test.HUnit (assertEqual, Test(TestList, TestCase), runTestTT)
import Lexer
import Parser
import Debug.Trace

lexer1HelloWorld :: Test
lexer1HelloWorld = TestCase $ do 
                    content <- readFile "test/1helloworld.lua"
                    let tokens = alexScanTokens content
                    assertEqual "Lexer 1 Hello World" tokens expectation
  where expectation :: [Token]
        expectation = [TokenIdentifier "print", TokenLeftParentheses, TokenString "Hello, world!", TokenRightParentheses, 
                       TokenLocal, TokenIdentifier "x", TokenAssign, TokenInteger 5,
                       TokenLocal, TokenIdentifier "y", TokenAssign, TokenInteger 10,
                       TokenIdentifier "print", TokenLeftParentheses, TokenIdentifier "x", TokenAdd, TokenIdentifier "y", TokenRightParentheses]

parser1HelloWorld :: Test
parser1HelloWorld = TestCase $ do
                      content <- readFile "test/1helloworld.lua"
                      let tokens = alexScanTokens content
                      let ast = parse tokens
                      assertEqual "Parser 1 Hello World " ast expectation
  where expectation :: Grammar
        expectation = ChunkBlock (
                        BlockStatList (
                          StatListCons (
                            StatFunctionCall (
                              FunctionCall (
                                PrefixVar (
                                  VarName "print")) (
                                ArgsExpList (
                                  ExpListSingle (
                                    ExpString "Hello, world!"))))) (
                            StatListCons (
                              StatLocalAttribNameList (
                                AttnamelistCons (
                                  "x") (
                                  AttribEmpty )) (
                                ExpListSingle (
                                  ExpInteger 5))) (
                              StatListCons (
                                StatLocalAttribNameList (
                                  AttnamelistCons (
                                    "y") (
                                    AttribEmpty )) (
                                  ExpListSingle (
                                    ExpInteger 10))) (
                                StatListSingle (
                                  StatFunctionCall (
                                    FunctionCall (
                                      PrefixVar (
                                        VarName "print")) (
                                      ArgsExpList (
                                        ExpListSingle (
                                          ExpBinop (
                                            ExpPrefix (
                                              PrefixVar (
                                                VarName "x"))) (
                                            BinopPlus) (
                                            ExpPrefix (
                                              PrefixVar (
                                                VarName "y")))))))))))))

parseAllOthers :: Test
parseAllOthers = TestList $ fmap testcase fileAndHints
  where fileAndHints :: [(String, String)]
        fileAndHints = [
                        -- ("test/2ifelse.lua", "Parser 2 if else"),
                        -- ("test/3loop.lua", "Paser 3 loop"),
                        ("test/4function.lua", "Paser 4 function")
                        -- ("test/5table.lua", "Parser 5 table"),
                        -- ("test/6mutileassignment.lua", "Parser 6 mutile assignment"),
                        -- ("test/7errorhandling.lua", "Parser 7 error handling"),
                        -- ("test/8complex.lua", "Parser 8 complex")
                       ]
        testcase (file, hint) = TestCase $ do
                                  content <- readFile file
                                  let tokens = alexScanTokens content
                                  putStrLn $ "\n" ++ file
                                  let ast = parse tokens
                                  putStrLn $ show $ length $ show ast

main :: IO ()
main = runTestTT (TestList [lexer1HelloWorld, parser1HelloWorld, parseAllOthers]) >>= print