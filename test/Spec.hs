import Test.HUnit (assertEqual, Test(TestList, TestCase), runTestTT)
import Lexer
import Debug.Trace

test1HelloWorld :: Test
test1HelloWorld = TestCase $ do 
                    content <- readFile "test/Lexer/1helloworld.lua"
                    let test = alexScanTokens content
                    assertEqual "Test 1 Hello World" test expectation
  where expectation :: [Token]
        expectation = [TokenIdentifier "print", TokenParenthesesOpen, TokenString "Hello, world!", TokenParenthesesClose, 
                       TokenLocal, TokenIdentifier "x", TokenAssign, TokenInteger 5,
                       TokenLocal, TokenIdentifier "y", TokenAssign, TokenInteger 10,
                       TokenIdentifier "print", TokenParenthesesOpen, TokenIdentifier "x", TokenAdd, TokenIdentifier "y", TokenParenthesesClose]

main :: IO ()
main = runTestTT (TestList [test1HelloWorld]) >>= print