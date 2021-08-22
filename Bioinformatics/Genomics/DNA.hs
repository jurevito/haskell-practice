
module Genomics.DNA
(
    Base(A, T, G, C),
    randomSeq,
    count,
    complement
) where

import System.Random
import qualified Data.Map as M

data Base = A | T | G | C deriving (Eq, Ord, Bounded, Enum, Show)

instance Random Base where
    random g = case randomR (fromEnum (minBound :: Base), fromEnum (maxBound :: Base)) g of (r, g') -> (toEnum r, g')
    randomR (a,b) g = case randomR (fromEnum a, fromEnum b) g of (r, g') -> (toEnum r, g')

randomSeq :: Int -> Int -> [Base]
randomSeq n seed = take n $ randoms (mkStdGen seed) :: [Base]

count :: [Base] -> M.Map Base Integer
count = foldl (\acc b -> M.insertWith (+) b 1 acc) (M.fromList [(A, 0), (T, 0), (G, 0), (C, 0)])

complement :: Base -> Base
complement A = T
complement T = A
complement G = C
complement C = G