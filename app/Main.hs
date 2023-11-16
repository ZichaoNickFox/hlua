module Main (main) where

import Lexer.Lexer

main :: IO ()
main = do
  putStrLn "a"
  _ <- getChar
  putStrLn "exit"
