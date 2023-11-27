module Main (main) where

import Lexer
import Parser
import Options.Applicative as O
import Data.Maybe
import System.Directory
import System.IO
import System.FilePath

data Options = Options {
  filePath :: Maybe FilePath,
  dirPath :: Maybe FilePath
}

optionsParser :: O.Parser Options
optionsParser = Options
  <$> O.optional (strOption (long "file" <> metavar "FILENAME" <> help "single lua file"))
  <*> O.optional (strOption (long "dir" <> metavar "DIRECTORY" <> help "project root dir"))

parseFile :: FilePath -> IO ()
parseFile filePath = do
  content <- readFile filePath
  let tokens = alexScanTokens content
  let ast = parse tokens
  putStrLn $ show $ length $ show ast

traverseDirectory :: FilePath -> (FilePath -> IO ()) -> IO ()
traverseDirectory root visit = do
  contents <- getDirectoryContents root
  let relativePaths = filter (`notElem` [".", ".."]) contents
  let fullPaths = map (combine root) relativePaths
  mapM_ (\fullPath -> do
          isDirectory <- doesDirectoryExist fullPath
          if isDirectory then
            traverseDirectory fullPath visit
          else
            visit fullPath
        ) fullPaths

main :: IO ()
main = do
  options <- execParser $ info (optionsParser <**> helper) idm

  case options of
    Options { filePath = Just path } -> parseFile path
    Options { dirPath = Just path } -> traverseDirectory path (\f -> putStrLn f >> parseFile f)