module Main where

import qualified Genomics.DNA as DNA
import qualified Homework.A as A
import qualified Homework.B as B
import SupportFiles.Log
import qualified Homework.C as C
import qualified Homework.D as D

main :: IO ()
main = do
    result <- SupportFiles.Log.testWhatWentWrong B.parse B.whatWentWrong "Homework/SupportFiles/sample.log"
    putStr $ show result

