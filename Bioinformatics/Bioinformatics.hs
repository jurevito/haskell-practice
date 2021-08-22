module Bioinformatics
(
    transcription,
    reverseComplement,
    contentGC
) where

import System.Random
import qualified Data.Map as M

import qualified Genomics.DNA as DNA
import qualified Genomics.RNA as RNA

transcription :: [DNA.Base] -> [RNA.Base]
transcription = foldr (\b acc -> case b of 
        DNA.A -> RNA.A : acc
        DNA.T -> RNA.U : acc
        DNA.G -> RNA.G : acc
        DNA.C -> RNA.C : acc
    ) []

reverseComplement :: [DNA.Base] -> [DNA.Base]
reverseComplement = reverse . (map DNA.complement)

contentGC :: [DNA.Base] -> Float
contentGC seq = (fromIntegral $ foldl (\acc b -> if b == DNA.G || b == DNA.C then acc + 1 else acc) 0 seq) / (fromIntegral $ length seq)

