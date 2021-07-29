{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import SupportFiles.Log

parseMessage :: String -> LogMessage
parseMessage [] = Unknown ""
parseMessage (x:xs)
    | x == 'I' = LogMessage Info (read $ head $ words xs :: Int) (unwords $ drop 1 $ words xs)
    | x == 'W' = LogMessage Warning (read $ head $ words xs :: Int) (unwords $ drop 1 $ words xs)
    | x == 'E' = LogMessage (Error (read $ head $ words xs :: Int)) (read $ words xs !! 1 :: Int) (unwords $ drop 2 $ words xs)
    | otherwise = Unknown (x:xs)

-- testParse parse 10 "Homework/SupportFiles/error.log"  
parse :: String -> [LogMessage]
parse xs = parseMessage <$> lines xs