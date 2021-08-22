module Homework.A
(
    doubleEveryOther,
    sumDigits,
    validate,
    hanoi
) where

-- Testing credit card number validity
toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = (n `mod` 10) : toDigitsRev (n `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = fst $ foldr (\x (acc, isOther) -> ((if isOther then x*2 else x) : acc, not isOther)) ([], False) xs

sumDigits :: [Integer] -> Integer
sumDigits = foldl (\acc x -> acc + (sum $ toDigitsRev x)) 0

validate :: Integer -> Bool
validate xs = (sumDigits $ doubleEveryOther $ toDigits xs) `mod` 10 == 0

-- The towers of Hanoi
type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n p1 p2 t1 = (hanoi (n-1) t1 p2 p1) ++ (p1,p2) : (hanoi (n-1) p1 t1 p2)
