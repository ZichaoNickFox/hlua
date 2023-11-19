import Test.HUnit (assertEqual, Test(TestList, TestCase), runTestTT)
import Lexer
import Debug.Trace

lexer1HelloWorld :: Test
lexer1HelloWorld = TestCase $ do 
                    content <- readFile "test/1helloworld.lua"
                    let test = alexScanTokens content
                    assertEqual "Test 1 Hello World" test expectation
  where expectation :: [Token]
        expectation = [TokenIdentifier "print", TokenLeftParentheses, TokenString "Hello, world!", TokenRightParentheses, 
                       TokenLocal, TokenIdentifier "x", TokenAssign, TokenInteger 5,
                       TokenLocal, TokenIdentifier "y", TokenAssign, TokenInteger 10,
                       TokenIdentifier "print", TokenLeftParentheses, TokenIdentifier "x", TokenAdd, TokenIdentifier "y", TokenRightParentheses]

-- parser1HelloWorld :: Test
-- parser1HelloWorld = TestCase $ do
--                       content <- readFile "test/1helloworld.lua"
--                       let test = 

main :: IO ()
main = runTestTT (TestList [lexer1HelloWorld]) >>= print