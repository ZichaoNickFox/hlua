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
                      assertEqual "Parser 1 Hello World "
  where expectation :: Grammer
        expectation = ChunkBlock (
                        BlockStatList (
                          StatListCons (
                            StatFunctionCall (
                              FunctionCall (
                                PrefixVar (
                                  VarName "print"
                                )
                                ArgsExpList (
                                    ExpListSingle (
                                      ExpString "Hello, world"
                                    )
                                )
                              )
                            )
                            StatLocalAttribNameList (

                            )
                          )
                        )
                      )
 print("Hello, world!") local x = 5 local y = 10 print(x + y)

main :: IO ()
main = runTestTT (TestList [parser1HelloWorld]) >>= print