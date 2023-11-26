import Test.HUnit (assertEqual, Test(TestList, TestCase), runTestTT)
import Lexer
import Parser
import Debug.Trace
import System.Posix.Internals (puts)

lexer1HelloWorldTest :: Test
lexer1HelloWorldTest = TestCase $ do
                        content <- readFile "test/1helloworld.lua"
                        let tokens = alexScanTokens content
                        assertEqual "Lexer 1 Hello World" tokens expectation
  where expectation :: [Token]
        expectation = [TokenIdentifier "print", TokenLeftParentheses, TokenString "Hello, world!", TokenRightParentheses,
                       TokenLocal, TokenIdentifier "x", TokenAssign, TokenInteger 5,
                       TokenLocal, TokenIdentifier "y", TokenAssign, TokenInteger 10,
                       TokenIdentifier "print", TokenLeftParentheses, TokenIdentifier "x", TokenAdd, TokenIdentifier "y", TokenRightParentheses]

parser1HelloWorldTest :: Test
parser1HelloWorldTest = TestCase $ do
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

lexer9StringTest :: Test
lexer9StringTest = TestCase $ do
                    content <- readFile "test/9string.lua"
                    let tokens = alexScanTokens content
                    -- assertEqual "Lexer 9 String" tokens expectation
                    print tokens
                    print expectation
  where expectation :: [Token]
        expectation = [
          -- TokenLocal, TokenIdentifier "a1", TokenAssign, TokenString "double quotes string",
          -- TokenLocal, TokenIdentifier "b1", TokenAssign, TokenString "'",
          -- TokenLocal, TokenIdentifier "c1", TokenAssign, TokenString "\"",
          -- TokenLocal, TokenIdentifier "d1", TokenAssign, TokenString "'d1'",
          -- TokenLocal, TokenIdentifier "e1", TokenAssign, TokenString "\"e1\"",
          -- TokenLocal, TokenIdentifier "f1", TokenAssign, TokenString "\'f1\'",

          TokenLocal, TokenIdentifier "a2", TokenAssign, TokenString "single quotes string",
          TokenLocal, TokenIdentifier "b2", TokenAssign, TokenString "\'",
          TokenLocal, TokenIdentifier "c2", TokenAssign, TokenString "\"",
          TokenLocal, TokenIdentifier "d2", TokenAssign, TokenString "\"d2\"",
          TokenLocal, TokenIdentifier "e2", TokenAssign, TokenString "\"e2\""]
          -- TokenLocal, TokenIdentifier "f2", TokenAssign, TokenString "'f2'",
          -- TokenLocal, TokenIdentifier "g2", TokenAssign, TokenString "\\"]
          -- TokenLocal, TokenIdentifier "h2", TokenAssign, TokenString ""\\"]

parseAllOthers :: Test
parseAllOthers = TestList $ fmap testcase fileAndHints
  where fileAndHints :: [(String, String)]
        fileAndHints = [
                        -- ("test/2ifelse.lua", "Parser 2 if else"),
                        -- ("test/3loop.lua", "Paser 3 loop"),
                        -- ("test/4function.lua", "Paser 4 function")
                        -- ("test/5table.lua", "Parser 5 table"),
                        -- ("test/6mutileassignment.lua", "Parser 6 mutile assignment"),
                        -- ("test/7errorhandling.lua", "Parser 7 error handling"),
                        -- ("test/8complex.lua", "Parser 8 complex"),
                        ("test/9string.lua", "Parser 9 string")
                       ]
        testcase (file, hint) = TestCase $ do
                                  content <- readFile file
                                  let tokens = alexScanTokens content
                                  putStrLn $ "\n" ++ file
                                  let ast = parse tokens
                                  print $ length $ show ast

convertSQ2DQTest :: Test
convertSQ2DQTest = do
  assertEqual (convertSQ2DQTest '"') "\"\\\"\""
  assertEqual (convertSQ2DQTest '\"') "\"\\\"\""
  assertEqual (convertSQ2DQTest '\'') "\"\'\""
  assertEqual (convertSQ2DQTest '"""') "\"\\\"\\\"\\\"\""
  assertEqual (convertSQ2DQTest '\""\"') "\"\\\"\\\"\\\"\""
  assertEqual (convertSQ2DQTest '\\\'') "\"\\'\""

main :: IO ()
main = runTestTT (TestList testlist) >>= print
  where testlist = [
          convertSQ2DQTest
          -- lexer9StringTest
          -- lexer1HelloWorldTest,
          -- parser1HelloWorldTest,
          -- parseAllOthersTest,
          ]