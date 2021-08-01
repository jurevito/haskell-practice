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

singleton :: LogMessage -> MessageTree
singleton m = Node Leaf m Leaf

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert _ tree@(Node _ (Unknown _) _) = tree

insert m Leaf = singleton m
insert m1@(LogMessage _ t1 _) (Node leftTree m2@(LogMessage _ t2 _) rightTree)
    | t1 > t2   = Node leftTree m2 (insert m1 rightTree)
    | otherwise = Node (insert m1 leftTree) m2 rightTree

-- build $ parseMessage <$> ["I 6 Completed armadillo processing", "E 65 8 Bad pickle-flange interaction detected", "I 1 Nothing to report", "I 4 Everything normal", "E 70 3 Way too many pickles", "E 20 2 Too many pickles"]
build :: [LogMessage] -> MessageTree
build = foldr insert Leaf

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node leftTree m rightTree) = inOrder leftTree ++ m : inOrder rightTree

seriousError :: LogMessage -> Bool
seriousError (LogMessage (Error s) _ _) = s > 50
seriousError _ = False

message :: LogMessage -> String
message (Unknown m) = m
message (LogMessage _ _ m) = m

-- testWhatWentWrong parse whatWentWrong "Homework/SupportFiles/sample.log"
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong xs = message <$> inOrder (build $ filter seriousError xs)
