module Main (main) where

import Lexer
import Parser
import Options.Applicative as O
import Data.Maybe

data Options = Options {
  getFilePath :: Maybe FilePath,
  getDirPath :: Maybe FilePath
}

getOptions :: IO Options
getOptions = execParser $ info (optionsParser <**> helper) idm
  where optionsParser :: O.Parser Options
        optionsParser = Options
          <$> O.optional (strOption (long "file" <> short 'f' <> metavar "FILENAME" <> help "single lua file"))
          <*> O.optional (strOption (long "dir" <> short 'd' <> metavar "DIRECTORY" <> help "project root dir"))

parseFile :: FilePath -> IO ()
parseFile filePath = do
  content <- readFile filePath
  let tokens = alexScanTokens content
  let ast = parse tokens
  putStrLn $ show $ length $ show ast

main :: IO ()
main = do
  options <- getOptions

  let filePath = getFilePath options
  if isJust filePath then
    parseFile $ fromJust filePath
  else
    putStrLn "b"